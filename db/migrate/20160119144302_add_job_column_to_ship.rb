class AddJobColumnToShip < ActiveRecord::Migration
  def change
    add_reference :ships, :job, index: true, foreign_key: true
  end
end
