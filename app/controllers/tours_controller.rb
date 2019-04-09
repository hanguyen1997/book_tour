class ToursController < ApplicationController
  def index 
      @tours_domestic = Tour.tours_domestic(1)
      @tours_international = Tour.tours_international(2)
  end
end
