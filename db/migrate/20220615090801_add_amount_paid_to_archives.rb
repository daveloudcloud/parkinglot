class AddAmountPaidToArchives < ActiveRecord::Migration[6.1]
  def change
    add_column :archives, :amount_paid, :integer
  end
end
