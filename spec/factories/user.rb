FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    age { Faker::Number.between(from: 18, to: 65) }
    gender_id { Faker::Number.between(from: 2, to: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    profile { Faker::Lorem.sentence }
  end
end
