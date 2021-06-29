class ApplicationController < ActionController::Base
  
	before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :

  # def admin
  #   if @user_active: true 
  #     redirect_to admin_users_path
  #   else
  #     redirect_to new_user_session_path
  #     flash[:notice] = "This user is not valid for now!"
  #   end
  # end
 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name last_name contact password password_confirmation])
  end

end
