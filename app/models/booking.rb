class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :description_detail

  scope :booking_by_status, ->{where status: true}
end
