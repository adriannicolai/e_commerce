class UsersController < ApplicationController
  before_action :check_logged_in?

  def index
  end

  def profile
    @user = User.find_by(id: session[:user]["user_id"])
  end

  def orders
  end

  def addresses
    @addresses = User.find_by(id: session[:user]["user_id"]).addresses
  end

  def signout
    session.destroy
    redirect_to "/"
  end
end
