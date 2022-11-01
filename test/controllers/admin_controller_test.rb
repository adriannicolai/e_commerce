require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_index_url
    assert_response :success
  end

  test "should get dashboard" do
    get admin_dashboard_url
    assert_response :success
  end
end
