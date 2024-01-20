class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :identifier, null: false, default: ''
      t.string :name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.timestamps
    end
  end
end
