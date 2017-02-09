class Person < ApplicationRecord
  validates :first_name, presence: true,
                        length: { minimum: 2 }
  validates :email, presence: true
  validates :password, presence: true
  validates :date_of_birth, presence: true
  validates :gender, presence: true
end
