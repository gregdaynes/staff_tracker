ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def new_person
    { 
      first_name: 'john',
      last_name: 'doe',
      email: 'john_doe@testers.com',
      date_of_birth: Date.new(1970,01,01),
      gender: 'computer',
      password: 'abc123',
      password_confirmation: 'abc123'
    }
  end

  def new_staff
    {
      pod: 'One',
      started_at_company: Date.new(2017,01,01),
      person_id: Person.first.id
    }
  end
end
