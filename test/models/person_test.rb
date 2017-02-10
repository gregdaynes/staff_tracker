require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def setup
    @person = Person.new(new_person)
  end

  test "should be valid" do
    assert @person.valid?
  end

  test "first_name is required" do
    @person.first_name = nil
    assert_not @person.valid?
  end

  test "first_name needs to be 2 or more characters" do
    @person.first_name = 'A'
    assert_not @person.valid?
  end
  
  test "email should be present" do
    @person.email = nil
    assert_not @person.valid?
  end

  test "email should be valid" do
    @person.email = 'greg@stembolt'
    assert_not @person.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com User@foo.com A_something@user.co.uk first.last@foo.jp foo+bar@baz.com]
    valid_addresses.each do |address|
      @person.email = address
      assert @person.valid?, "#{address.inspect} should be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_person = @person.dup
    duplicate_person.email = @person.email.upcase
    @person.save
    assert_not duplicate_person.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@StemBolt.cOm"
    @person.email = mixed_case_email
    @person.save
    assert_equal mixed_case_email.downcase, @person.reload.email
  end

  test "date_of_birth should be present" do
    @person.date_of_birth = nil
    assert_not @person.valid?
  end

  test "date_of_birth should be a date" do
    @person.date_of_birth = 'nov eleventh ninteen eighty six'
    assert_not @person.valid?
  end

  test "date_of_birth could be a date string" do
    @person.date_of_birth = '1986/11/04' 
    assert @person.valid?
  end

  test "gender should be present" do
    @person.gender = nil
    assert_not @person.valid?
  end

  test "gender should be saved as lower-case" do
    mixed_case_gender = "Male"
    @person.gender = mixed_case_gender
    @person.save
    assert_equal mixed_case_gender.downcase, @person.reload.gender
  end

  test "password should be present" do
    @person.password = nil
    assert_not @person.valid?
  end

  test "password should have matching password_confirmation" do
    @person.password_confirmation = '123abc'
    assert_not @person.valid?
  end

  test "password should have a minimum length" do
    @person.password = @person.password_confirmation = "a" * 5
    assert_not @person.valid?
  end
end
