class BookingsController < ApplicationController

  def new 
  	 @description_detail = DescriptionDetail.find_by id: params[:id]
  	 @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to bookings_path
    else
      render 'new'
    end
  end

  private

	def booking_params
	  params.require(:booking).permit(:user_id, :description_detail_id, :status, :price, :quantity)
	end

end
