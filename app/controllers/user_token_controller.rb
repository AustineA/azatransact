class UserTokenController < ApplicationController

  def create
    user = auth_from_password

    unless user
      render json: { message: "User not found" }, status: 404
      return
    end

    render json: {
        jwt: TokenGenerator.call( {sub: user.id} ),
        user: {
          name: "#{user.first_name} #{user.last_name}",
        }
      }, status: :created

  end


  private

  def auth_from_password
		user = User.find_by email: params["auth"]["email"] 

    return false unless user

    user.authenticate(params[:auth][:password])
  end


  def auth_params
    params.require(:auth).permit(:password, :email)
  end
end
