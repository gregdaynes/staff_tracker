require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should show person" do
    get people_url(@person)
    assert_response :success
  end

  test "should get new" do
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post people_url,
        params: {
          person: new_person
        }
    end

    assert_redirected_to person_url(Person.last)
    assert_equal 'Person was successfully created.', flash[:notice]
  end

  test "should show edit form" do
    get edit_person_url(@person)
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person),
      params: {
        person: {
          id: @person.id,
          first_name: 'George'
        }
      }

    @person.reload
    assert_equal 'George', @person.first_name
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
