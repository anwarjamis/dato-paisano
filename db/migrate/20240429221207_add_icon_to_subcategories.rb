class AddIconToSubcategories < ActiveRecord::Migration[7.0]
  def change
    add_column :subcategories, :icon, :string
  end
end
