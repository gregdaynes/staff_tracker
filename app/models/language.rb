class Language < ApplicationRecord
  has_many :staff_member_languages
  has_many :staff_members, through: :staff_member_languages

  validates_presence_of :language
end
