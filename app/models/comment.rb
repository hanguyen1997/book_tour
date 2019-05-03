class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review

  scope :comments_by_review, ->(review_id){where review_id: review_id}
  
end
