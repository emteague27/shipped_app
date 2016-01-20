class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :name
      t.float :length
      t.string :location
      t.string :ship_type
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
