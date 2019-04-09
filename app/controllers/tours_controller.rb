class ToursController < ApplicationController
  def index
    if params[:filter] == "tours_domestic"
      @tours_domestic = Tour.tours_domestic(1)
    else
      @tours_international = Tour.tours_international(2)
    end
  end
end
