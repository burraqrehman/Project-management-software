module Admin
  class UsersController < BaseController
    before_action :set_user, only: %i[show edit update destroy activate]

    def index
      @users = User.all
    end

    def show; end

    def new
      @user = User.new
    end

    def create 
      @user = User.new(user_params)

      if @user.save
        redirect_to [:admin, @user], notice: "User was successfully created."
      else
        render 'new'
      end
    end

    def edit; end

    def update 
      if @user.update(user_params)
        redirect_to [:admin, @user], notice: "User was successfully created."
      else
        render 'edit'
      end
    end

    def destroy 
      @user.destroy
      redirect_to root_path
    end

    def activate
      if (@user.admin == true)
        @user.update_attribute(:admin, false)
        redirect_to admin_users_path
      else
        @user.update_attribute(:admin, true)
        redirect_to admin_users_path
      end
    end

    private 

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :contact)
    end
  end
end
