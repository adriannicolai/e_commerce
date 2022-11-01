class UsersController < ApplicationController
  before_action :check_logged_in?

  def index
  end

  def show
  end

  def update
  end

  def profile
    @user = User.find_by(id: session[:user]["user_id"])
  end

  def signout
    session.destroy
    redirect_to "/"
  end
end
