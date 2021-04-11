class RealState < ApplicationRecord
  validates :name, presence: true,  length: { maximum: 128 }
  validates :street, presence: true,  length: { maximum: 128 }
  validates :external_number, presence: true, length: { maximum: 12 }, format: { with: /([a-zA-Z0-9\-]+)/, message: "only allows alfanumeric and dashes" }
  validates :internal_number, presence: true, if: ->{}
  validates :internal_number, format: { with: /([a-zA-Z0-9\- ]+)/, message: "only allows alfanumeric, dashes and spaces" }
  validates :neighborhood, presence: true, length: { maximum: 128 }
  validates :city, presence: true, length: { maximum:64 }
  validates :country, inclusion: { in: ISO3166::Country.all.map(&:alpha2) }
  validates :bathrooms, presence: true
  validates :comments, length: { maximum: 128 }
  
  validate :bathroom_count
  
  enum type: [:house, :department, :land, :commercial_ground]
  
  private 

  def bathroom_count
    return if ["land", "commercial_ground"].include?(type) || bathrooms > 0 

    errors.add(:bathrooms, "must be 1 or more")
  end
end
