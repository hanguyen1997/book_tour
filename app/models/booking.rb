class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :description_detail
end
