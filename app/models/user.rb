class User < ApplicationRecord

  has_many :products

  validates :email, presence: true

  has_secure_password
end
