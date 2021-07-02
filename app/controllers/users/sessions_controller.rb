class Users::SessionsController < Devise::SessionsController

  def create
    super
  end

  def after_sign_in_path_for(resource)
    # byebug
    if current_user.admin? || current_user.manager?
      admin_users_path(current_user)
    else
      user_path(current_user)
    end
  end
end
