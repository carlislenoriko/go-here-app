class Pin < ApplicationRecord
  belongs_to :category
  belongs_to :maps

  geocoded_by :address
  after_validation :geocode
end
