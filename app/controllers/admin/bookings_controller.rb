module Admin
	class BookingsController < BaseController
		
		def index
			@admin_bookings = Booking.booking_by_status.paginate(page: params[:page], per_page: 10)
		end
	end
end

