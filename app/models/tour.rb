class Tour < ApplicationRecord
  belongs_to :category
  has_many :description_details
  has_many :reviews

  mount_uploader :image, ImageUploader

  validate :image_size

  scope :tours_international, ->(category_id){where category_id: category_id}
  scope :tours_domestic, ->(category_id){where category_id: category_id}

  private

  def image_size
    return errors.add :image, "Loi hinh anh" if image.size > 5.megabytes
  end
end
