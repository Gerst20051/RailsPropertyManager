class Property < ApplicationRecord
  acts_as_paranoid

  has_many :unit, dependent: :destroy

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
