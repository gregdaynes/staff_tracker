class Language < ApplicationRecord
  has_many :user_languages
  has_many :users, through: :user_languages

  validates_presence_of :language
end
