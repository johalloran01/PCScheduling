require "test_helper"

class UserAvailabilityTest < ActiveSupport::TestCase

  def setup
    @user = users(:one)
    @time_slot = time_slots(:morning_slot)
    @user2 = users(:two)
    @time_slot2 = time_slots(:afternoon_slot)
  end

  test "should find existing user availability from fixtures" do
    # Test that the fixture user and timeslot data is equal to that of the instance variables.
    existing_availability = UserAvailability.find_by(user: @user, time_slot: @time_slot)

    assert_equal @user, existing_availability.user
    assert_equal @time_slot, existing_availability.time_slot
    assert existing_availability.valid?
  end

  test "should allow same user to have different time slots" do
    # User one should be able to have afternoon_slot (different from fixture)
    new_availability = UserAvailability.new(user: @user, time_slot: @time_slot2)
    assert new_availability.valid?
    assert new_availability.save
  end

  test "should allow different users to have same time slot" do
    # User two should be able to have morning_slot (same as user one)
    new_availability = UserAvailability.new(user: @user2, time_slot: @time_slot)
    assert new_availability.valid?
    assert new_availability.save
  end

  test "should require both user and time slot" do
    availability = UserAvailability.new

    assert_not availability.valid?
    assert_includes availability.errors[:user], "must exist"
    assert_includes availability.errors[:time_slot], "must exist"
  end

  test "should prevent duplicate user-time_slot combinations" do
    # This test focuses on the core business rule
    # We know from fixtures that user:one + time_slot:morning_slot already exists
    initial_count = UserAvailability.where(user: @user, time_slot: @time_slot).count
    duplicate = UserAvailability.new(user: @user, time_slot: @time_slot)

    # The record should not be valid
    assert_not duplicate.valid?

    # And it should not save
    assert_not duplicate.save

    # Check that we still only have one record for this combination
    count = UserAvailability.where(user: @user, time_slot: @time_slot).count
    assert_equal 1, count, "Should only have one record for this user-time_slot combination"
  end
end