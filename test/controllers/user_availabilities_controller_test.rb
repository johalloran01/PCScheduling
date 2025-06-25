require "test_helper"

class UserAvailabilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_availabilities_index_url
    assert_response :success
  end

  test "should get create" do
    get user_availabilities_create_url
    assert_response :success
  end

  test "should get update" do
    get user_availabilities_update_url
    assert_response :success
  end
end
