module Admin
	class Admin::ToursController < BaseController
		before_action :load_tour, except: %i(index new create)
		before_action :load_categories

		def index
			 @admin_tours = Tour.available.paginate(page: params[:page], per_page: 10)
		end

		def show
    		 @admin_descripption_details = DescriptionDetail.hidden_expired_detail.desription_detail_by_tour @admin_tour
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

	  	def edit; end

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
		    @admin_tour.toggle! :deleted_at
		    flash[:success] = "xoa tour thanh cong"
		    redirect_to admin_tours_path
		end

	  	private

		    def admin_tour
		      params.require(:tour).permit(:name, :category_id, :content, :image, :deleted_at)
		    end

		    def load_categories
		      @categories = Category.all
		    end

		    def load_tour
		      @admin_tour = Tour.available.find_by id: params[:id]
		      return if @admin_tour
		      flash[:danger] = "khong co tour can tim"
		      redirect_to admin_tours_url
		  	end
	end
end
