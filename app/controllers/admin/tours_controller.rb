module Admin
	class Admin::ToursController < BaseController
		def index
			 @admin_tours = Tour.all.paginate(page: params[:page], per_page: 10)
		end
	end
end
