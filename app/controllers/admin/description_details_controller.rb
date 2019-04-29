module Admin
	class DescriptionDetailsController < BaseController
		before_action :load_description_detail, only: %i(edit update destroy)
	    before_action :load_tour, only: %i(new create)

		def new; 
		  @description_detail = DescriptionDetail.new
		end

		def create
	      @description_detail = @tour.description_details.build description_detail_params
	      if @description_detail.save
	        flash[:success] = t ".create_success"
	        redirect_to admin_tour_path @description_detail.tour_id
	      else
	        render :new
	      end
	    end

	    def edit; 
	    end

	    def update
	      if @description_detail.update_attributes description_detail_params
	        flash[:success] = t ".detail_updated"
	        redirect_to admin_tour_path @description_detail.tour_id
	      else
	        render :edit
	      end
	    end

	    def destroy
	    	if @description_detail.destroy
			    flash[:success] = "xoa danh muc thanh cong"
			    redirect_to admin_tour_path @description_detail.tour_id
			else
				flash[:success] = "xoa danh muc khong thanh cong"
				redirect_to admin_tour_path @description_detail.tour_id
		 	end
		end

	    private

		def description_detail_params
		      params.require(:description_detail).permit :price, :tour_id, :start_day, :end_day, :max_quantity
		end

		def load_description_detail
	      @description_detail = DescriptionDetail.find_by id: params[:id]
	      return if @description_detail
	      flash[:danger] = t ".error_detail_id"
	      redirect_to admin_tours_path
	    end 

	    def load_tour
	      @tour = Tour.find_by id: params[:tour_id]
	      return if @tour
	      flash[:danger] = "error"
	      redirect_to admin_tours_path
	    end
	end
end
