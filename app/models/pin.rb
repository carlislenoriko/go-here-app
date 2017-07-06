class Pin < ApplicationRecord
  belongs_to :category
  belongs_to :map

  geocoded_by :address
  after_validation :geocode
end
