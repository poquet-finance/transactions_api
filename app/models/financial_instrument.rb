# == Schema Information
#
# Table name: financial_instruments
#
#  id              :bigint           not null, primary key
#  balance         :decimal(, )      default(0.0), not null
#  identifier      :bigint           not null
#  instrument_type :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  bank_id         :bigint
#  person_id       :bigint
#
# Indexes
#
#  index_financial_instruments_on_bank_id    (bank_id)
#  index_financial_instruments_on_person_id  (person_id)
#
class FinancialInstrument < ApplicationRecord
  belongs_to :person
  belongs_to :bank
  has_many :transactions

  validates :identifier, uniqueness: { scope: :bank_id }

  enum instrument_type: {
    bank_account: 0,
    credit_card: 1
  }
end
