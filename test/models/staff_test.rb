require 'test_helper'

class StaffTest < ActiveSupport::TestCase
  def setup
    @staff = Staff.new(new_staff)
    @staff.person = people(:one)
  end

  test "should be valid" do
    assert @staff.valid?
  end

  test "pod is required" do
    @staff.pod = nil
    assert_not @staff.valid?
  end
  
  test "started_at_company date is required" do
    @staff.started_at_company = nil
    assert_not @staff.valid?
  end

  test "person association is required" do
    @staff.person = nil
    assert_not @staff.valid?
  end

  test "time_at_company is not empty" do
    assert_operator 0, :<=,  @staff.time_at_company[:days]
    assert_operator 0, :<=,  @staff.time_at_company[:hours]
  end
end

