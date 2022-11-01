class ShopController < ApplicationController
  before_action :redirect_to_home_if_logged_in?, only: [:signin, :signup]

  def index
  end

  def signin
  end

  def signup
  end
end
