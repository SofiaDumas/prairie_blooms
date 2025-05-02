class ProductPrice < ApplicationRecord
  validates :price, numericality: { greater_than: 0 }
  validates :effective_date, presence: true
  belongs_to :product
end

def product_params
  params.require(:product).permit(
    :product_name, :description, :stock_quantity, :category_id,
    product_prices_attributes: %i[price effective_date]
  )
end
