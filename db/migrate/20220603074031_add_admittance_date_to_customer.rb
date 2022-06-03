class AddAdmittanceDateToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :admittance_date, :string
  end
end
