class AddFieldnameToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :overnight, :boolean
  end
end
