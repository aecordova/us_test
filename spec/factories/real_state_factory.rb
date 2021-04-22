# frozen_string_literal: true
require 'faker'

FactoryBot.define do
  factory :real_state do
    name { Faker::Ancient.titan }
    property_type { "house" }
    street { Faker::Address.street_name }
    external_number { Faker::Address.building_number }
    internal_number { Faker::Address.building_number }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city}
    country { 'US' }
    rooms { rand(2..6) }
    bathrooms { 1.5 }
    comments { Faker::Lorem.sentence }
  end
end
