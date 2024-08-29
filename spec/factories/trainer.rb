FactoryBot.define do
  factory :trainer do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { Gimei.name.last.kanji }
    first_name { Gimei.name.first.kanji }
    last_name_reading { Gimei.name.last.hiragana }
    first_name_reading { Gimei.name.first.hiragana }
    age { Faker::Number.between(from: 18, to: 65) }
    gender_id { Faker::Number.between(from: 2, to: 4) } # 1が'---'を表している場合を想定
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    registration_number { Faker::Number.number(digits: 6) }
    career { Faker::Lorem.sentence }
    profile { Faker::Lorem.sentence }
  end
end
