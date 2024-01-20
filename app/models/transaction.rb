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
end
