class Person < ApplicationRecord
  before_save {
    email.downcase!
    gender.downcase!
  }

  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true,
                         length: { minimum: 2 }
  validates :email, presence: true,
                    format: { with: valid_email_regex },
                    uniqueness: { case_sensitive: false }
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :password, presence: true,
                       length: { minimum: 6 }

  has_secure_password
end
