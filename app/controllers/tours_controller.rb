class ToursController < ApplicationController
  
  def index 
      @tours_domestic = Tour.tours_domestic(1)
      @tours_international = Tour.tours_international(2)
  end

  def show 
  	  @tour = Tour.find_by id: params[:id]
  	  @descripption_details = DescriptionDetail.all.desription_detail_by_tour @tour
  	  @tours_domestic = Tour.tours_domestic(1).sample(4)
      @tours_international = Tour.tours_international(2).sample(4)
  end
end
