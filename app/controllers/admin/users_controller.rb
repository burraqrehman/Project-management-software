module Admin
	class UsersController < BaseController
		before_action :set_user, only: [:show, :update, :edit, :destroy]

		def index
			@users = User.all
		end

		def show
			
		end

		def new
			@user = User.new
		end

		def create 
			@user = User.new(user_params)

			if @user.save
				redirect_to [:admin, @user]
			else
				render 'new'
			end
		end

		def edit
			
		end

		def update 
			if @user.update(user_params)
				redirect_to [:admin, @user]
			else
				render 'edit'
			end
		end

		def destroy 
			@user.destroy
			redirect_to root_path
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
