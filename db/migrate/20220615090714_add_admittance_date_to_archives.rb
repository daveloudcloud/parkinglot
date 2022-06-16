class AddAdmittanceDateToArchives < ActiveRecord::Migration[6.1]
  def change
    add_column :archives, :admittance_date, :string
  end
end
