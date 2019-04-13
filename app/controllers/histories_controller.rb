class HistoriesController < ApplicationController
  before_action :logged_in_user

  def index
  	# binding.pry
    @bookings = @current_user.bookings.paginate(page: params[:page], per_page: 5)
  end
end
