class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :description_detail

  scope :booking_by_status, ->{where status: true}

  def paypal_url return_path
    values = {
      business: "test-ban@gmail.com",
      return: "#{Rails.application.secrets.app_host}#{return_path}",
      notify_url: "#{Rails.application.secrets.app_host}/update",
      invoice: id,
      cmd: "_xclick",
      amount: description_detail.price,
      item_name: description_detail.tour.name,
      item_number: description_detail.id,
      quantity: description_detail.bookings.last.quantity
    }

 #    DescriptionDetail.all.each_with_index do |item, index|
	#     values.merge!({
	#       "amount_#{index + 1}" => item.price,
	#       "item_name_#{index + 1}" => item.tour.name,
	#       "item_number_#{index + 1}" => item.id,
	#       "quantity_#{index + 1}" => item.max_quantity
	#     })
	# end

    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" +
      values.to_query
  end
end
