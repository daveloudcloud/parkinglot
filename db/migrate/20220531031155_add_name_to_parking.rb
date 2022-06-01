class AddNameToParking < ActiveRecord::Migration[6.1]
  def change
    add_column :parkings, :name, :string
  end
end
