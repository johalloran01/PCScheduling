require "application_system_test_case"

class UserAvailabilitiesTest < ApplicationSystemTestCase
  setup do
    @user_availability = user_availabilities(:one)
  end

  test "visiting the index" do
    visit user_availabilities_url
    assert_selector "h1", text: "User availabilities"
  end

  test "should create user availability" do
    visit user_availabilities_url
    click_on "New user availability"

    click_on "Create User availability"

    assert_text "User availability was successfully created"
    click_on "Back"
  end

  test "should update User availability" do
    visit user_availability_url(@user_availability)
    click_on "Edit this user availability", match: :first

    click_on "Update User availability"

    assert_text "User availability was successfully updated"
    click_on "Back"
  end

  test "should destroy User availability" do
    visit user_availability_url(@user_availability)
    click_on "Destroy this user availability", match: :first

    assert_text "User availability was successfully destroyed"
  end
end
