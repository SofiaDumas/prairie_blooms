class CreateEcommerces < ActiveRecord::Migration[8.0]
  def change
    create_table :ecommerces do |t|
      t.string :name

      t.timestamps
    end
  end
end
