class Map < ApplicationRecord
  belongs_to :user

  has_many :pins
  has_many :favorites, through: :users

  # geocoded_by :address
  # after_validation :geocode
  # https://anadea.info/blog/how-to-integrate-google-maps-into-ruby-on-rails-app
end
