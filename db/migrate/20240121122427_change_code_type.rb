class ChangeCodeType < ActiveRecord::Migration[7.1]
  def change
    add_column :banks, :bank_code, :integer, null: false
    remove_column :banks, :code
    remove_column :banks, :name
  end
end
