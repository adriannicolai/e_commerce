class Api::UsersController < ApplicationController
  # For user signup
  def create
    @user = User.new(user_params)

    @error_object = @user.errors.messages unless @user.save
  end

  def update
  end

  # For user login
  def authenticate_user
    @user = User.find(email: params.dig(:email), password: params.dig(:password))

    if @user.present?
      helpers.set_user_session(user)
    else
      @error_object = @user.errors.messages
    end
  end

  private
  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
