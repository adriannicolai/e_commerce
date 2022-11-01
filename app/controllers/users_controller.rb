class UsersController < ApplicationController
  def index
  end

  def show
  end

  def update
  end

  def signout
    session.destroy
    redirect_to "/"
  end
end
