# spec/factories/staff_members.rb

FactoryGirl.define do
  factory :staff_member do |f|

  end

  factory :invalid_staff_member, parent: staff_member do |f|
    
  end
end
