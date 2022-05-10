class TokenGenerator < ApplicationService
    attr_reader :payload
  
    def initialize(payload)
      @payload = payload
    end

    def call
      JWT.encode payload, Rails.application.credentials.secret_key_base, 'HS256'
    end
end