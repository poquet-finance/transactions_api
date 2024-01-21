# == Schema Information
#
# Table name: transactions
#
#  id                      :bigint           not null, primary key
#  branch                  :string
#  currency                :integer          default(0), not null
#  date                    :datetime         not null
#  desctiption             :string
#  doc_number              :string
#  identifier              :bigint
#  in                      :decimal(, )      not null
#  number_of_payments      :integer
#  out                     :decimal(, )      not null
#  quota                   :string
#  total                   :decimal(, )      not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  financial_instrument_id :bigint
#  person_id               :bigint
#
# Indexes
#
#  index_transactions_on_financial_instrument_id  (financial_instrument_id)
#  index_transactions_on_person_id                (person_id)
#
class Transaction < ApplicationRecord
  belongs_to :financial_instrument
  belongs_to :person
  validate :same_person_id_as_financial_instrument
  validate :total_equals_in_minus_out

  enum currency: {
    clp: 0,
    usd: 1
  }

  private

  def total_equals_in_minus_out
    errors.add(:total, 'Total must be difference of in and out') if total != (self.in - out).abs
  end

  def same_person_id_as_financial_instrument
    errors.add(:person_id, 'Transaction must belong to same person as financial instrument') if person_id != financial_instrument.person_id
  end
end
