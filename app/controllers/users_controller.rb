class UsersController < ApplicationController

  def create
    @user = User.create(user_params)

    if @user.save
      render json: { message: "User created successfully" }, status: :created
      return
    end

    render json: { message: @user.errors.full_messages.to_sentence }, status: :unprocessable_entity
  end


  private
  
  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
