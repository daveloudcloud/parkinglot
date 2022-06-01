class AddClientTypeToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :client_type, :string
  end
end
