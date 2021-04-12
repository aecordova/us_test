# frozen_string_literal: true

json.data do
  json.array! @all_real_states, :name, :property_type, :city, :country
end
