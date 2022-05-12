RSpec.describe "CurrencyConverter" do

  it "converts from input currency to output currency" do
    input_amount = 5000
    input_currency = "USD"
    output_currency = "NGN"
    output_value = CurrencyConverter.call(input_amount, input_currency, output_currency)
    expect(output_value).to be_positive
  end

end