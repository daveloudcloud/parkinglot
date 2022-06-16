class AddEmployeeEmailToArchives < ActiveRecord::Migration[6.1]
  def change
    add_column :archives, :employee_email, :string
  end
end
