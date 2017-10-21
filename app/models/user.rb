class User < ApplicationRecord

  has_many :products
  has_many :reviews

  validates :email, presence: true

  has_secure_password
end
