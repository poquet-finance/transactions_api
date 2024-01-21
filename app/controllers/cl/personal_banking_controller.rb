#
# nododc
#
class Cl::PersonalBankingController < ApplicationController
  before_action :set_bank

  def income_v2
    personal_banking_params
  end

  def income
    personal_banking_params
  end

  def products
    personal_banking_params
  end

  def transactions
    render json: @bank.financial_instruments.flat_map(&:transactions).select { |t| t.financial_instrument.bank_account? }
  end

  def credit_card_transactions
    render json: @bank.financial_instruments.flat_map(&:transactions).select { |t| t.financial_instrument.credit_card? }
  end

  private

  def set_bank
    @bank = Bank.includes(financial_instruments: :transactions).find_by(bank)
    raise "Couldn't find bank with #{bank}" if @bank.nil?
  end

  def personal_banking_params
    params.permit(:bank, :id, :history, :password)
  end

  def bank
    bank_data = personal_banking_params[:bank]&.split('_')
    { bank_code: bank_data.first, banking_type: Bank.banking_type_translation[bank_data.second.to_sym] }
  end
end
