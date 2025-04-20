class CreateStores < ActiveRecord::Migration[8.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :description
      t.string :logo_url
      t.string :contact_email
      t.string :phone

      t.timestamps
    end
  end
end
