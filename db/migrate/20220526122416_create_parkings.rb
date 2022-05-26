class CreateParkings < ActiveRecord::Migration[6.1]
  def change
    create_table :parkings do |t|
      t.integer :customer_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
