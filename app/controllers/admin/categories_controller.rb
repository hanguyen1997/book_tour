module Admin
	class CategoriesController < BaseController
		def index
			@admin_categories = Category.all.paginate(page: params[:page], per_page: 5)
		end
		 		 
  		def new
    		@admin_category = Category.new
  		end

  		def create
	    	@admin_category = Category.new(admin_category)
		    if @admin_category.save
		      redirect_to admin_categories_path
		    else
		      render 'new'
		    end
	  	end

	  	def edit
		    @admin_category = Category.find(params[:id])
		end

		def update
		    @admin_category = Category.find(params[:id])
		    if @admin_category.update_attributes(admin_category)
		      flash[:success] = "da chinh sua"
      		  redirect_to admin_categories_path
		    else
		      render 'edit'
		    end
		 end


	  	def destroy
		    Category.find_by(id: params[:id]).destroy
		    flash[:success] = "xoa danh muc"
		    redirect_to admin_categories_path
		 end

	  	private

		    def admin_category
		      params.require(:category).permit(:name)
		    end

			
		   


	end
end
