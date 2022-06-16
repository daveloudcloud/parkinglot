class CreateArchives < ActiveRecord::Migration[6.1]
  def change
    create_table :archives do |t|
      t.string :plate_number
      t.string :vehicle_type
      t.string :client_type
      t.boolean :overnight

      t.timestamps
    end
  end
end
