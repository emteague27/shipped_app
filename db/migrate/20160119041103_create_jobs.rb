class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :current_location
      t.string :destination
      t.integer :containers_needed
      t.decimal :cost
      t.text :cargo
      t.references :ship, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
