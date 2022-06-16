class AddAdmittanceTimeToArchives < ActiveRecord::Migration[6.1]
  def change
    add_column :archives, :admittance_time, :string
  end
end
