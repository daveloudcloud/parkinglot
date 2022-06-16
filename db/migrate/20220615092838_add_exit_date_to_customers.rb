class AddExitDateToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :exit_date, :string
  end
end
