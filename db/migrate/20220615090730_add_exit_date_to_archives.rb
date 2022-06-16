class AddExitDateToArchives < ActiveRecord::Migration[6.1]
  def change
    add_column :archives, :exit_date, :string
  end
end
