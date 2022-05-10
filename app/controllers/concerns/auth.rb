module Auth
  extend ActiveSupport::Concern

  def current_user
    return unless decode_user

    begin
      User.find(decode_user)
    rescue
      render json: { message: "Please login to continue"}, status: :unauthorized
    end

  end

  def authenticate_user
    unless current_user
      render json: { message: "Please login to continue"}, status: :unauthorized
      return false
    end
  end

  private

  def token_from_request_headers
    unless request.headers['Authorization'].nil?
      request.headers['Authorization'].split.last
    end
  end


  def decode_user
    return false unless token_from_request_headers

    begin
      decoded_token = JWT.decode token_from_request_headers, Rails.application.credentials.secret_key_base, true, { algorithm: 'HS256' }
      return decoded_token[0]['sub']
    rescue 
      return false
    end
  end

end