module Admin
	class CategoriesController < BaseController
		def index
			 @admin_categories = Category.all
		end
		 		 
  		def new
  		end
	end
end