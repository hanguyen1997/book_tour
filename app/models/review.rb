class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  has_many :comments  
end
