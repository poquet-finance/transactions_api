class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.belongs_to :person
      t.belongs_to :financial_instrument
      t.string :desctiption
      t.string :branch
      t.string :quota
      t.string :doc_number
      t.integer :number_of_payments
      t.bigint :identifier
      t.decimal :total, null: false
      t.datetime :date, null: false
      t.decimal :in, null: false
      t.decimal :out, null: false
      t.integer :currency, null: false, default: 0
      t.timestamps
    end
  end
end
