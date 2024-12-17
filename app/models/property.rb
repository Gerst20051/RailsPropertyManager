class Property < ApplicationRecord
  has_many :unit, dependent: :destroy

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
