class AddIndexToCategoriesCategoryName < ActiveRecord::Migration[8.0]
  def change
    add_index :categories, :category_name, unique: true
  end
end
