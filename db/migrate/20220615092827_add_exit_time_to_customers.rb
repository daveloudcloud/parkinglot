class AddExitTimeToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :exit_time, :string
  end
end
