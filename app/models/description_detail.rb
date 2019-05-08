class DescriptionDetail < ApplicationRecord
  belongs_to :tour
  has_many :bookings

  validates :price, presence: true,
    numericality: {greater_than_or_equal_to: 1}
  validates :start_day, presence: true
  validates :end_day, presence: true
  validate :check_day, on: [:update, :create]

  scope :desription_detail_by_tour, ->(tour_id){where tour_id: tour_id}
  scope :hidden_expired_detail, ->{where "start_day > ?", Date.today}

  def check_day
    if start_day.present? && end_day.present?
      if start_day > end_day || Date.today > start_day
        errors.add :error, I18n.t("error_check_day")
      end
    end
  end

end
