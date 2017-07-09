class User < ApplicationRecord
  has_secure_password

  has_many :maps
  has_many :pins, through: :maps
  has_many :favorites
end
