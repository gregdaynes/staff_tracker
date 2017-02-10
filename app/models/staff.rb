include ActionView::Helpers::DateHelper

class Staff < ApplicationRecord
  belongs_to :person

  validates :pod,
    presence: true
  validates :started_at_company,
    presence: true

  def time_at_company 
    seconds_passed = Time.now - started_at_company.to_time
    days = (seconds_passed / 86164.1).to_i
    seconds_minus_days = seconds_passed % 86164.1
    hours = (seconds_minus_days / 3600).to_i

    { 
      :days => days,
      :hours => hours
    }
  end
end

