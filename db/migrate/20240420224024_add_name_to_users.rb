class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :first_last_name, :string
    add_column :users, :second_last_name, :string
    add_column :users, :birth, :date
    add_column :users, :phone, :integer
    add_reference :users, :gender, null: false, foreign_key: true
    add_reference :users, :origen, null: false, foreign_key: true
  end
end
