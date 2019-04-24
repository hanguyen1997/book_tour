module Admin
	class UsersController < BaseController
		def index
			 @admin_users = User.all.paginate(page: params[:page], per_page: 10)
		end
		 	

		def new; 
		end
	end
end
