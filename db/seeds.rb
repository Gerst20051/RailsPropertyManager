# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

1000.times {
  property = Property.create(
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
  )
  if Faker::Boolean.boolean
    Faker::Number.between(from: 1, to: 10).times {
      property.unit.create(
        bathroom_count: Faker::Number.between(from: 0, to: 6),
        bedroom_count: Faker::Number.between(from: 0, to: 10),
        rent_price: Faker::Number.between(from: 600, to: 5000),
        square_footage: Faker::Number.between(from: 200, to: 1200),
      )
    }
  end
}
