require 'test_helper'

class StaffControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff = staff(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "should get index of all staff" do
    get staff_index_url
    assert_response :success
  end

  test "should get staff member" do
    get staff_url(@staff)
    assert_response :success
  end

  test "should get new form" do
    get new_staff_url
    assert_response :success
  end

  test "should create new staff" do
    assert_difference('Staff.count') do
      post staff_index_url,
        params: {
          staff: new_staff
        }
    end

    assert_redirected_to staff_url(Staff.last)
    assert_equal 'Staff member was successfully created.', flash[:notice]
  end

  test "should get edit form" do
    get edit_staff_url(@staff)
    assert_response :success
  end

  test "should update staff" do
    patch staff_url(@staff),
      params: {
        staff: {
          pod: 'best pod'
        }
      }
    @staff.reload
    assert_equal 'best pod', @staff.pod
  end

  test "should destroy staff" do
    assert_difference('Staff.count', -1) do
      delete staff_url(@staff)
    end

    assert_redirected_to staff_index_url
  end
end
