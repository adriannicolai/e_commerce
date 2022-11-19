class ShopController < ApplicationController
  before_action :redirect_to_home_if_logged_in?, only: [:signin, :signup]
  before_action :is_user_admin, only: [:index]

  def index
  end

  def signin
  end

  def signup
  end

  private
  def is_user_admin
    redirect_to "/admin" if session[:user].present? && session[:user]["user_level"] === "admin"
  end
end
