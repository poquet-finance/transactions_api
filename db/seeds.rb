# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
banks = [:santander, :chile, :bci, :bice, :estado, :scotia, :itau, :security, :falabella, :ripley].map do |code|
  {bank_code: code, banking_type: :personal}
end
Bank.insert_all(banks)

dummy_people = [
  { name: 'Basilio', last_name: 'Casas', identifier: '5.866.365-4' },
  { name: 'Julia', last_name: 'Gallardo', identifier: '6.317.965-5' },
  { name: 'Eva', last_name: 'María', identifier: '11.456.155-K' },
  { name: 'Eduardo', last_name: 'Gil', identifier: '11.616.031-5' },
  { name: 'Elena', last_name: 'Gil', identifier: '14.159.284-K' },
  { name: 'Jose', last_name: 'Antonio', identifier: '17.888.348-8' },
  { name: 'Cristina', last_name: 'Marin', identifier: '20.307.639-8' },
  { name: 'Juan', last_name: 'Carlos', identifier: '23.606.772-6' },
  { name: 'Yolanda', last_name: 'Nieto', identifier: '27.516.829-7' },
  { name: 'Ramon', last_name: 'Esteban', identifier: '28.226.799-3' },
  { name: 'Jose', last_name: 'Antonio', identifier: '29.070.219-4' }
]
Person.insert_all(dummy_people)

accounts = [
  { person_id: 1, bank_id: 1, identifier: '00505306', balance: 100_000.98, instrument_type: :bank_account },
  { person_id: 1, bank_id: 2, identifier: '86419138', balance: 2_000_000.12, instrument_type: :bank_account },
  { person_id: 1, bank_id: 3, identifier: '61169832', balance: 561_201.31, instrument_type: :bank_account },
  { person_id: 2, bank_id: 5, identifier: '21063771', balance: 100_000.98, instrument_type: :bank_account },
  { person_id: 3, bank_id: 2, identifier: '37265431', balance: 100_000.98, instrument_type: :bank_account },
  { person_id: 4, bank_id: 7, identifier: '83357923', balance: 100_000.98, instrument_type: :bank_account },
  { person_id: 5, bank_id: 4, identifier: '31283850', balance: 100_000.98, instrument_type: :bank_account },
  { person_id: 6, bank_id: 8, identifier: '88646262', balance: 100_000.98, instrument_type: :bank_account },
  { person_id: 7, bank_id: 9, identifier: '860319905832', balance: 100_000.98, instrument_type: :bank_account },
  { person_id: 8, bank_id: 10, identifier: '149694549026', balance: 100_000.98, instrument_type: :bank_account },
  { person_id: 9, bank_id: 3, identifier: '006922672142', balance: 100_000.98, instrument_type: :bank_account },
  { person_id: 10, bank_id: 6, identifier: '549107', balance: 100_000.98, instrument_type: :bank_account },
  { person_id: 11, bank_id: 5, identifier: '602275', balance: 100_000.98, instrument_type: :bank_account }
]
FinancialInstrument.insert_all(accounts)

credit_cards = [
  { person_id: 6, bank_id: 6, identifier: '2345', instrument_type: :credit_card },
  { person_id: 2, bank_id: 7, identifier: '3142', instrument_type: :credit_card },
  { person_id: 1, bank_id: 1, identifier: '3291', instrument_type: :credit_card },
  { person_id: 6, bank_id: 4, identifier: '8346', instrument_type: :credit_card },
  { person_id: 2, bank_id: 10, identifier: '2547', instrument_type: :credit_card },
  { person_id: 1, bank_id: 1, identifier: '7106', instrument_type: :credit_card }
]
FinancialInstrument.insert_all(credit_cards)

transactions = [
  { person_id: 1, financial_instrument_id: 1, desctiption: 'Pago por deuda', doc_number: '1234', identifier: 'e31dcbcd-3aed-47cd-a71c-d0d2c44d7f8c', in: 10_000, out: 0, total: 10_000, quota: '1', number_of_payments: '', date: '21-01-2024'},
  { person_id: 3, financial_instrument_id: 5, desctiption: 'Pago por deuda', doc_number: '1234', identifier: 'e31dcbcd-3aed-47cd-a71c-d0d2c44d7f8c', in: 10_000, out: 0, total: 10_000, quota: '1', number_of_payments: '', date: '21-01-2024'},
  { person_id: 6, financial_instrument_id: 17, desctiption: 'Pago por deuda', doc_number: '1234', identifier: 'e31dcbcd-3aed-47cd-a71c-d0d2c44d7f8c', in: 10_000, out: 0, total: 10_000, quota: '1', number_of_payments: '', date: '21-01-2024'}
]
Transaction.insert_all(transactions)
