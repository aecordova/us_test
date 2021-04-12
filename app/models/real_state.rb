class RealState < ApplicationRecord
  COUNTRY_CODES = ISO3166::Country.all.map(&:alpha2)

  validates :name, presence: true,  length: { maximum: 128 }
  validates :street, presence: true,  length: { maximum: 128 }
  validates :external_number, presence: true, length: { maximum: 12 }, format: { with: /([a-zA-Z0-9\-]+)/, message: "only allows alfanumeric and dashes" }
  validates :internal_number, presence: true, if: ->{["department", "commercial_ground"].include?(type)}
  validates :internal_number, format: { with: /([a-zA-Z0-9\- ]+)/, message: "only allows alfanumeric, dashes and spaces" }
  validates :neighborhood, presence: true, length: { maximum: 128 }
  validates :city, presence: true, length: { maximum:64 }
  validates :country, presence: true, inclusion: { in: COUNTRY_CODES }
  validates :rooms, numericality: true
  validates :bathrooms, numericality: { greater_than: 0 }, unless: ->{["land", "commercial_ground"].include?(type) }
  validates :bathrooms, presence: true, numericality: true
  validates :comments, length: { maximum: 128 }

  enum type: [:house, :department, :land, :commercial_ground]


end
