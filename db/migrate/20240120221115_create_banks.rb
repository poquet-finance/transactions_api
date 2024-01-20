class CreateBanks < ActiveRecord::Migration[7.1]
  def change
    create_table :banks do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.integer :type, null: false, default: 0
      t.timestamps
    end
  end
end
