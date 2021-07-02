module Manager
  class BaseController < ApplicationController
    before_action :validate_admin_or_manager

    def validate_admin_or_manager

      # if !(current_user.admin? || current_user.manager?)
      #   flash[:notice] = 'You are not validate for this action'
      #   redirect_to new_user_session_path
      # end
      return redirect_to root_path unless current_user.admin? || current_user.manager?
    end
  end
end
