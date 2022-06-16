class AddStartTimeToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :start_time, :integer
  end
end
