class User < ApplicationRecord
  has_secure_password

  has_many :maps
  has_many :pins, through: :maps
  has_many :favorites
  has_many :friends
  has_many :followers, through: :friends
  

  has_attached_file :avatar,
                    :styles => { :medium => "150x150>", :thumb => "44x44#" },
                    :default_url => "/images/default.png"

  validates_attachment :avatar, :presence => true,
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                       :size => { :in => 0..1000.kilobytes }

end
