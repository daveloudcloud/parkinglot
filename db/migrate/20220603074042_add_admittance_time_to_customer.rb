class AddAdmittanceTimeToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :admittance_time, :string
  end
end
