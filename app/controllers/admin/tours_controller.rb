module Admin
	class Admin::ToursController < BaseController
		before_action :load_categories
		def index
			 @admin_tours = Tour.all.paginate(page: params[:page], per_page: 10)
		end

		def show
    		 @admin_tour = Tour.find_by id: params[:id]
    		 @admin_descripption_details = DescriptionDetail.all.desription_detail_by_tour @admin_tour
  		end

		def new
    		@admin_tour = Tour.new
  		end

  		def create
	    	@admin_tour = Tour.new(admin_tour)
		    if @admin_tour.save
		      flash[:success] = "them tour thanh cong"
		      redirect_to admin_tours_path
		    else
		      render 'new'
		    end
	  	end

	  	def edit
		    @admin_tour = Tour.find(params[:id])
		end

		def update
		    @admin_tour = Tour.find(params[:id])
		    if @admin_tour.update_attributes(admin_tour)
		      flash[:success] = "da chinh sua thanh cong"
      		  redirect_to admin_tours_path
		    else
		      render 'edit'
		    end
		 end

	  	def destroy
		    Tour.find_by(id: params[:id]).destroy
		    flash[:success] = "xoa tour thanh cong"
		    redirect_to admin_tours_path
		end

	  	private

		    def admin_tour
		      params.require(:tour).permit(:name, :category_id, :content, :image)
		    end

		    def load_categories
		      @categories = Category.all
		    end
	end
end
