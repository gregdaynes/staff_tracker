# spec/factories.rb
FactoryGirl.define do
  factory :person do
    first_name 'John'
    last_name 'Doe'
    sequence :email do |n|
      "john.doe.#{n}@example.com"
    end
    password "abc123"
    password_confirmation "abc123"
    date_of_birth Date.new(1970,01,01)
    gender "Computer"

    trait :invalid do
      first_name nil
    end
  end

  factory :staff do
    pod 1
    started_at_company Date.new(2017,01,01)
    person

    trait :invalid do
      person nil
    end

    trait :no_pod do
      pod nil
    end
  end

  factory :presentation do
    title "Test Presentation"
    content "Lorem ipsum dolor"
    date_of_presentation Date.new(2017,02,18)

    trait :invalid do
      title nil
    end
  end
end
