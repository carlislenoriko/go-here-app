class User < ApplicationRecord
  has_many :maps
  has_many :favorites
end
