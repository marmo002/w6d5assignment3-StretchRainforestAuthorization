class Product < ApplicationRecord
  has_many :reviews

  belongs_to :user

  validates :name, :description, :price, presence: true

  def price_in_dollars
    price_in_dollars = price.to_f
    sprintf("$%.2f", price_in_dollars)
  end

end
