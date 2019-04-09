class Tour < ApplicationRecord
  belongs_to :category
  has_many :description_details

  scope :tours_international, ->(category_id){where category_id: category_id}
  scope :tours_domestic, ->(category_id){where category_id: category_id}
end
