class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :comment, :product_id, presence: true
end
