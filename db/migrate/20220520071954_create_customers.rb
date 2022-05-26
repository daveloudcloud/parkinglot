class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :plate_number
      t.string :vehicle_type
      t.string :reference_id

      t.timestamps
    end
  end
end
