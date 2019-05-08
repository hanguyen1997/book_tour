class BookingsController < ApplicationController

  def new 
  	 @description_detail = DescriptionDetail.find_by id: params[:id]
  	 @booking = Booking.new
  end

  def create
    @description_detail = DescriptionDetail.find_by id: params[:booking][:description_detail_id]
    if params[:booking][:quantity].blank? || params[:booking][:quantity].to_i > @description_detail.max_quantity
      @booking = Booking.new
      render "new"
    else
      @booking = Booking.new(booking_params)
      if @booking.save
        redirect_to edit_booking_path @booking
      else
        render 'new'
      end
    end
  end

  def show
	@booking = Booking.find_by id: params[:id]
  end

  def edit 
  	 @booking = Booking.find_by id: params[:id]
  end

  def update
  	@booking = Booking.find_by id: params[:id]
  	if @booking.toggle! :status
  	  max_quantity = @booking.description_detail.max_quantity - @booking.quantity
  	  @booking.description_detail.update_attribute :max_quantity, max_quantity 
  	  redirect_to booking_path
  	else
  	  render "edit"
  	end
  end

  private

	def booking_params
	  params.require(:booking).permit(:user_id, :description_detail_id, :status, :price, :quantity)
	end

end
