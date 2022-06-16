class AddBalanceToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :balance, :integer
  end
end
