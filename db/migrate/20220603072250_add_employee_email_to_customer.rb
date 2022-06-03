class AddEmployeeEmailToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :employee_email, :string
  end
end
