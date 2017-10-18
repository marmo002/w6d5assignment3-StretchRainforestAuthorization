class Review < ApplicationRecord
  belongs_to :product

  validates :comment, :product_id, presence: true
end
