class TokenDecoder < ApplicationService
  attr_reader :auth_header

  def initialize(auth_header)
    @auth_header = auth_header
  end

  def call
    return false unless token_from_request_headers

    begin
      return JWT.decode( token_from_request_headers, Rails.application.credentials.secret_key_base, true, { algorithm: 'HS256' })[0]['sub']
    rescue 
      return false
    end
  end

  private

  def token_from_request_headers
    unless auth_header.nil?
      auth_header.split.last
    end
  end


end