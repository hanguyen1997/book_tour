class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  scope :reviews_by_tour, ->(tour_id){where tour_id: tour_id}
  
end
