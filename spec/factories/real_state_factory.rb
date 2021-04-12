FactoryBot.define do
  factory :real_state do
    name { 'some_name' }
    type { 'house' }
    street { 'some_street_name' }
    external_number { '123' }
    internal_number { '456' }
    neighborhood { 'some_hood' }
    city { 'somecity' }
    country { 'MX' }
    rooms { 2 }
    bathrooms { 1.5 }
    comments { "Everything's alright" }
  end
end
