module Auth
  extend ActiveSupport::Concern

  def current_user
    decode_user = TokenDecoder.call(request.headers['Authorization'])
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

end