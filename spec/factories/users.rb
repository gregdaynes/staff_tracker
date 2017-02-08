# spec/factories/users.rb

FactoryGirl.define do
  factory :user do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.email { Faker::Internet.email }
    f.password { Faker::Crypto.md5 }
    f.date_of_birth { Faker::Date.between(80.year.ago, 18.year.ago) }
    f.gender { Faker::Hipster.word }
  end

  factory :invalid_user, parent: :user do |f|
    f.firstname nil
  end
end
