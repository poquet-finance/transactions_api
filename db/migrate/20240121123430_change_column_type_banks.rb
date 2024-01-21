class ChangeColumnTypeBanks < ActiveRecord::Migration[7.1]
  def change
    add_column :banks, :banking_type, :integer, null: false, default: 0
    remove_column :banks, :type
  end
end
