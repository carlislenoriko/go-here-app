class Map < ApplicationRecord
  belongs_to :user

  has_many :pins
  has_many :favorites, through: :users
end
