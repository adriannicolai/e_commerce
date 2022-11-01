class ShopController < ApplicationController
  before_action :check_logged_in?, only: [:signin, :signup]

  def index
  end

  def signin
  end

  def signup
  end

  private
  # Redirect to home page if logged in
  def check_logged_in?
    redirect_to "/" if session[:user].present?
  end
end
