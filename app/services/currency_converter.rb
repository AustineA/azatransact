class CurrencyConverter < ApplicationService
  attr_reader :input_amount
  attr_reader :input_currency
  attr_reader :output_currency


  def initialize(input_amount, input_currency, output_currency)
    @input_amount = input_amount
    @input_currency = input_currency
    @output_currency = output_currency
  end

  def call 
    response = HTTParty.get(
      "https://api.apilayer.com/exchangerates_data/convert?to=#{output_currency}&from=#{input_currency}&amount=#{input_amount}",
      headers: header,
    )

    raise StandardError, response unless response["success"]
    
    response["result"]
  end

  private

  def header
    { 
      "apikey" => "gnT4aVSQXdaoMICB0C9tKMGWWWPkUMak", 
      "content-type" => "application/json" 
    }
  end

end


# require "uri"
# require "net/http"

# url = URI("https://api.apilayer.com/exchangerates_data/convert?to=NGN&from=USD&amount=10")

# https = Net::HTTP.new(url.host, url.port);
# https.use_ssl = true

# request = Net::HTTP::Get.new(url)
# request['apikey'] = "gnT4aVSQXdaoMICB0C9tKMGWWWPkUMak"

# response = https.request(request)
# puts response.read_body