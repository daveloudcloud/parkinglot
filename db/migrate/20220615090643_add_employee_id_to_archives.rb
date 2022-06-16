class AddEmployeeIdToArchives < ActiveRecord::Migration[6.1]
  def change
    add_column :archives, :employee_id, :integer
  end
end
