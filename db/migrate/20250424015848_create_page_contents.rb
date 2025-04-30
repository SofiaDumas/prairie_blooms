class CreatePageContents < ActiveRecord::Migration[8.0]
  def change
    create_table :page_contents do |t|
      t.string :page_name
      t.text :content

      t.timestamps
    end
  end
end
