require "test_helper"

class Api::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_addresses_create_url
    assert_response :success
  end
end
