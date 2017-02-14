class Presentation < ApplicationRecord
  has_many :person_presentations
  has_many :people, through: :person_presentations
end
