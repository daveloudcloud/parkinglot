class CreateSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :slots do |t|
      t.integer :total_space

      t.timestamps
    end
  end
end
