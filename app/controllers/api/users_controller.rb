class Api::UsersController < ApplicationController
  # For user signup
  def create
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

  private
end
