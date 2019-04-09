class BookingsController < ApplicationController
  def index
    @tours = Tours.all
  end
end
