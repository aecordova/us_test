# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

25.times do |index|
  property_type = ["house", "department", "land", "commercial_ground"][rand(0..4)]
  RealState.create!(
    name: Faker::Ancient.titan,
    property_type: property_type,
    street: Faker::Address.street_name,
    external_number: Faker::Address.building_number,
    internal_number: Faker::Address.building_number,
    neighborhood: Faker::Address.community,
    city: Faker::Address.city,
    country: Faker::Address.country_code,
    rooms: rand(1..5),
    bathrooms: ["land", "commercial_ground"].include?(property_type) ? 0 : rand(1..4),
    comments: Faker::Lorem.sentence
  )
  puts "Creating record #{index+1}/20"
end

