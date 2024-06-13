class CreateSuggestions < ActiveRecord::Migration[7.0]
  def change
    create_table :suggestions do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :networking
      t.boolean :mentoring
      t.boolean :partnership
      t.boolean :investors
      t.boolean :subsidies
      t.boolean :growth
      t.boolean :start
      t.boolean :others

      t.timestamps
    end
  end
end
