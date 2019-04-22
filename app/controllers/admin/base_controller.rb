module Admin
	class BaseController < ApplicationController
		layout "admin/application"

	    before_action :authenticate_admin

	    private

	    def authenticate_admin
	      return if logged_in_as_admin?
	      flash[:danger] = "permission denied"
	      redirect_to login_path
	    end
	end
end
