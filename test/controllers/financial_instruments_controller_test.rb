require "test_helper"

class FinancialInstrumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @financial_instrument = financial_instruments(:one)
  end

  test "should get index" do
    get financial_instruments_url, as: :json
    assert_response :success
  end

  test "should create financial_instrument" do
    assert_difference("FinancialInstrument.count") do
      post financial_instruments_url, params: { financial_instrument: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show financial_instrument" do
    get financial_instrument_url(@financial_instrument), as: :json
    assert_response :success
  end

  test "should update financial_instrument" do
    patch financial_instrument_url(@financial_instrument), params: { financial_instrument: {  } }, as: :json
    assert_response :success
  end

  test "should destroy financial_instrument" do
    assert_difference("FinancialInstrument.count", -1) do
      delete financial_instrument_url(@financial_instrument), as: :json
    end

    assert_response :no_content
  end
end
