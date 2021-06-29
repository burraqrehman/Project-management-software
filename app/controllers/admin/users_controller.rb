module Admin
  class UsersController < BaseController
    before_action :set_user, only: %i[show edit update destroy disable]

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
        render :new
      end
    end

    def edit; end

    def update 
      if @user.update(user_params)
        redirect_to [:admin, @user], notice: "User was successfully created."
      else
        render :edit
      end
    end

    def destroy 
      if @user.destroy
        flash[:notice] = "This user destroyed successfully"
        redirect_to root_path
      else
        flash[:notice] = "This user could not be destroyed"
      end
    end

    def disable
      if @user.active?
        @user.update(active: false)
        redirect_to admin_users_path 
      else
        @user.update(active: true)
        redirect_to admin_users_path 
      end
    end

    # def disable
    #   if @user.active?
    #     return redirect_to admin_users_path if @user.update(active: true)

    #   end

    #   redirect_to admin_users_path
    # end

    private 

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :contact, :password, :password_confirmation)
    end
  end
end
