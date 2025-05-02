class AddIndexToProductsProductName < ActiveRecord::Migration[8.0]
  def change
    add_index :products, :product_name, unique: true
  end
end
