class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :garment
  belongs_to :reviews

  validates :start_date, :end_date, :total_price, presence: true
  validate :valid_date

  def valid_date
    if :end_date < :start_date
      errors.add(:end_date, "Invalid dates. Must be AFTER start date.")
    end
  end
end
