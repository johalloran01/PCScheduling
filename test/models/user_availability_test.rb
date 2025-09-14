require "test_helper"

class UserAvailabilityTest < ActiveSupport::TestCase

  def setup
    @user = users(:one)
    @time_slot = time_slots(:morning_slot)
    @user2 = users(:two)
    @time_slot2 = time_slots(:afternoon_slot)

    puts "\n <===== Setup =====> "
    puts "User 1: #{@user.name} (ID: #{@user.id})"
    puts "User 2: #{@user2.name} (ID: #{@user2.id})"
    puts "Time Slot 1: #{@time_slot.start_time} - #{@time_slot.end_time} ID:(#{@time_slot.id}."
    puts "Time Slot 2: #{@time_slot2.start_time} - #{@time_slot2.end_time} ID:(#{@time_slot2.id}."
    puts "In the yml fixtures Alice has Time Slot 1 (09:00-09:30), Bob has Time Slot 2 (13:00-13:30). That's what we are testing against. \n"

  end

  test "should find existing user availability from fixtures" do
    # Test that the fixture data exists and is valid
    puts "\n=== TEST: Find Existing Availability ==="
    existing_availability = UserAvailability.find_by(user: @user, time_slot: @time_slot)
    puts "Found existing availability: #{existing_availability.inspect}"
    puts "Existing availability valid? #{existing_availability.valid?}"

    assert_not_nil existing_availability, "Fixture should have created a user availability"
    assert existing_availability.valid?
  end

  test "should allow same user to have different time slots" do
    # User one should be able to have afternoon_slot (different from fixture)
    puts "\n ==== TEST: Same User with Different Availability ====="
    new_availability = UserAvailability.new(user: @user, time_slot: @time_slot2)
    puts "New availability: #{new_availability.inspect}"
    puts "New Availability valid?: #{new_availability.valid?}"
    assert new_availability.valid?
    assert new_availability.save

    puts "Successfully saved new availability."
  end

  test "should allow different users to have same time slot" do
    # User two should be able to have morning_slot (same as user one)
    puts "\n ==== TEST: Different Users -> Same Time Slot ===="
    new_availability = UserAvailability.new(user: @user2, time_slot: @time_slot)
    puts "New Availability: #{new_availability.inspect}"
    puts "New Availability valid?: #{new_availability.valid?}"

    assert new_availability.valid?
    assert new_availability.save
    puts "Successfully saved new availability."
  end

  test "should require both user and time slot" do
    puts "\n ==== TEST: Does it have both a user and a time slot? ===="
    availability = UserAvailability.new
    puts "Empty Availability: #{availability.inspect}"
    puts "Empty Availability valid?: #{availability.valid?}"
    puts "Errors: #{availability.errors.full_messages}"

    assert_not availability.valid?
    assert_includes availability.errors[:user], "must exist"
    assert_includes availability.errors[:time_slot], "must exist"
  end

  test "should prevent duplicate user-time_slot combinations" do
    # This test focuses on the core business rule
    # We know from fixtures that user:one + time_slot:morning_slot already exists
    puts "\n === TEST: Duplicate Prevention and Logic === "

    initial_count = UserAvailability.where(user: @user, time_slot: @time_slot).count
    duplicate = UserAvailability.new(user: @user, time_slot: @time_slot)
    puts "Initial count for user #{@user.id} + time_slot #{@time_slot.id}: #{initial_count}"
    puts "Duplicate availability: #{duplicate.inspect}"
    puts "Duplicate Valid?: #{duplicate.valid?}"
    puts "Duplicate errors: #{duplicate.errors.full_messages}."
    # The record should not be valid
    assert_not duplicate.valid?
    
    # And it should not save
    assert_not duplicate.save
    
    # Check that we still only have one record for this combination
    count = UserAvailability.where(user: @user, time_slot: @time_slot).count
    puts "Final count for user #{@user.id} + time slot #{@time_slot.id}: #{count}"
    assert_equal 1, count, "Should only have one record for this user-time_slot combination"
  end
end