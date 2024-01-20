class FinancialInstrumentsController < ApplicationController
  before_action :set_financial_instrument, only: %i[ show update destroy ]

  # GET /financial_instruments
  def index
    @financial_instruments = FinancialInstrument.all

    render json: @financial_instruments
  end

  # GET /financial_instruments/1
  def show
    render json: @financial_instrument
  end

  # POST /financial_instruments
  def create
    @financial_instrument = FinancialInstrument.new(financial_instrument_params)

    if @financial_instrument.save
      render json: @financial_instrument, status: :created, location: @financial_instrument
    else
      render json: @financial_instrument.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /financial_instruments/1
  def update
    if @financial_instrument.update(financial_instrument_params)
      render json: @financial_instrument
    else
      render json: @financial_instrument.errors, status: :unprocessable_entity
    end
  end

  # DELETE /financial_instruments/1
  def destroy
    @financial_instrument.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial_instrument
      @financial_instrument = FinancialInstrument.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def financial_instrument_params
      params.fetch(:financial_instrument, {})
    end
end
