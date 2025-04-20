class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :street
      t.string :city
      t.string :postal_code
      t.string :province

      t.timestamps
    end
  end
end
