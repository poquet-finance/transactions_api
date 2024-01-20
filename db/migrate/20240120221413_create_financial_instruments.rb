class CreateFinancialInstruments < ActiveRecord::Migration[7.1]
  def change
    create_table :financial_instruments do |t|
      t.belongs_to :person
      t.belongs_to :bank
      t.decimal :balance, null: false, default: 0.0
      t.integer :instrument_type, null: false, default: 0
      t.bigint :identifier, null: false
      t.timestamps
    end
  end
end
