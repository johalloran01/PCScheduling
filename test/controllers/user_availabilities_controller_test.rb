require "test_helper"

class UserAvailabilitiesControllerTest < ActionDispatch::IntegrationTest
  # test "should get index" do
  #   get user_availabilities_index_url
  #   assert_response :success
  # end

  # test "should get create" do
  #   get user_availabilities_create_url
  #   assert_response :success
  # end

  # test "should get update" do
  #   get user_availabilities_update_url
  #   assert_response :success
  # end

  setup do
    @user = users(:one)
    @time_slot = time_slots(:morning_slot)

  end

  test "should update user availabilities" do
    patch user_availabilities_url, params: { time_slot_ids: [@time_slot.id] }
    assert_redirected_to user_availabilities_url
  
    puts "Flash notice: #{flash[:notice]}"
    puts "User availabilities: #{@user.user_availabilities.reload.map(&:time_slot_id)}"
  
    assert_equal 'Availability updated successfully!', flash[:notice]
    assert_equal [@time_slot.id], @user.user_availabilities.reload.map(&:time_slot_id)
  end
end
