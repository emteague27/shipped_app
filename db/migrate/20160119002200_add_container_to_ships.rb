class AddContainerToShips < ActiveRecord::Migration
  def change
    add_column :ships, :container_no, :integer
  end
end
