class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.string :payment_method
      t.decimal :amount
      t.string :payment_status

      t.timestamps
    end
  end
end
