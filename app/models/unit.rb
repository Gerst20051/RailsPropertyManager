class Unit < ApplicationRecord
  acts_as_paranoid

  belongs_to :property

  validates :bedroom_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :bathroom_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :square_footage, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :rent_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
