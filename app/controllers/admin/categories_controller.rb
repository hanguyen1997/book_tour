module Admin
	class CategoriesController < BaseController
		def index
			 @admin_categories = Category.all.paginate(page: params[:page], per_page: 5)
		end
		 		 
  		def new
  		end
	end
end