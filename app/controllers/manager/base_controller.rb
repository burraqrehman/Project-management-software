module Manager
  class BaseController < ApplicationController
    before_action :non_manager

    def non_manager
      if current_user.admin? || current_user.manager?
        # redirect_to root_path
      else
        flash[:notice] = 'You are not validate for this action'
        redirect_to new_user_session_path
      end
    end
  end
end
