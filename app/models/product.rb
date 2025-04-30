class Product < ApplicationRecord
  validates :product_name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :stock_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  belongs_to :category
  has_many :order_items
  has_many :product_prices
end
