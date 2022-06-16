class AddEndTimeToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :end_time, :integer
  end
end
