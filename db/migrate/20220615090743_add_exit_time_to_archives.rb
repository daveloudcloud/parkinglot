class AddExitTimeToArchives < ActiveRecord::Migration[6.1]
  def change
    add_column :archives, :exit_time, :string
  end
end
