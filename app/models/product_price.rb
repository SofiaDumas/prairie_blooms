class ProductPrice < ApplicationRecord
  validates :price, numericality: { greater_than: 0 }
  validates :effective_date, presence: true
  belongs_to :product
end
