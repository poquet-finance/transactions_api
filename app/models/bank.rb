# == Schema Information
#
# Table name: banks
#
#  id         :bigint           not null, primary key
#  bank_code  :integer          not null
#  type       :integer          default("personal"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Bank < ApplicationRecord
  has_many :financial_instruments

  validates :bank_code, uniqueness: { scope: :banking_type }

  enum banking_type: {
    personal: 0,
    enterprise: 1
  }

  enum bank_code: [
    :santander,
    :chile,
    :bci,
    :bice,
    :estado,
    :scotia,
    :itau,
    :security,
    :falabella,
    :ripley
  ]

  def self.banking_type_translation
    {
      personas: :personal,
      empresas: :enterprise
    }
  end
end
