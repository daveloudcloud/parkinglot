class AddParkingIdToSlot < ActiveRecord::Migration[6.1]
  def change
    add_column :slots, :parking_id, :integer
  end
end
