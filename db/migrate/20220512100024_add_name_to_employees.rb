class AddNameToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :name, :string
  end
end
