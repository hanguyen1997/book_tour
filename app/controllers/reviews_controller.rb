class ReviewsController < ApplicationController
  
  def create
  	@review = Review.new review_params
    if @review.save
      redirect_to tour_url params[:review][:tour_id]
    else
      flash[:success] = "binh luan khong thanh cong"
      render tour_url params[:review][:tour_id]
    end
  end

  private

    def review_params
      params.require(:review).permit(:user_id, :tour_id , :content)
    end
end
