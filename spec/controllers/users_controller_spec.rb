require "rails_helper"
require "users_controller"

# RAILS_ENV=test rspec ./spec/controllers/users_controller_spec.rb
RSpec.describe UsersController, type: :controller do
  # Red test case
  describe "The test cases here are in relation to user login" do
    it "Should not be able to navigate in change password page if the user is not logged in" do
      get :index

      expect(response).to redirect_to "/"
    end
  end
end
