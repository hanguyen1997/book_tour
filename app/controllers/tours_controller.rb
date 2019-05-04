class ToursController < ApplicationController
  before_action :load_tour, only: :show

  def index 
    @search = Tour.search params[:q]
    if params[:filter] == "tours_domestic"
      @tours = Tour.tours_domestic(1)
    elsif params[:filter] == "tours_international" 
      @tours = Tour.tours_international(2)
    else
      @tours = @search.result(distinct: true)
      .paginate(page: params[:page], per_page: 10)
    end
  end

  def show 
    @review = Review.new
    @reviews = Review.order("id DESC").reviews_by_tour(@tour).paginate(page: params[:page], per_page: 5)
    @comments = Comment.comments_by_review @review 
	  @descripption_details = DescriptionDetail.all.desription_detail_by_tour @tour
	  @tours_domestic = Tour.tours_domestic(1).sample(4)
    @tours_international = Tour.tours_international(2).sample(4)
  end

  private

  def load_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour
    flash[:danger] = "error"
    redirect_to root_url
  end
end
