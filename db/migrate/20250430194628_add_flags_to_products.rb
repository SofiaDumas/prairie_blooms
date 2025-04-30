class AddFlagsToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :on_sale, :boolean
    add_column :products, :new, :boolean
  end
end
