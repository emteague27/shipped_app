class AddShipNameColumnToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :ship_name, :string
  end
end
