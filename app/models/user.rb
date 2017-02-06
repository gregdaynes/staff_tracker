
# taken from http://guides.rubyonrails.org/active_record_validations.html
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ApplicationRecord
  validates :first_name, length: { minimum: 2 }, presence: true
  validates :email, presence: true, email: true
  validates :email, uniqueness: true, on: :create
  validates :password, presence: true, length: { minimum: 8 }
  validates :date_of_birth, presence: true
  validates :gender, presence: true
end
