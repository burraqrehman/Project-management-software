class Users::SessionsController < Devise::SessionsController

  def create
    super
  end

  def after_sign_in_path_for(resource)
  admin_users_path
  end
   
end
