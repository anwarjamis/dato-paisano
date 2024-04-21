class CreateOrigens < ActiveRecord::Migration[7.0]
  def change
    create_table :origens do |t|
      t.string :country

      t.timestamps
    end
  end
end
