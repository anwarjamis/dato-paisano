class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :description
      t.string :email
      t.string :link
      t.string :instagram
      t.string :facebook
      t.string :tiktok
      t.integer :phone
      t.references :user, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true
      t.references :subcategory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
