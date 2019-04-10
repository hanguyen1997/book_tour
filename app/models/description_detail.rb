class DescriptionDetail < ApplicationRecord
  belongs_to :tour

  scope :desription_detail_by_tour, ->(tour_id){where tour_id: tour_id}
end
