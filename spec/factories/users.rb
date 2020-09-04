FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 7)}
    password_confirmation {password}
    birth_date            {Faker::Date.birthday(min_age: 18, max_age: 65) }
    first_name            {"ダルビッシュ"}
    last_name             {"有"}
    first_name_kana       {"ダルビッシュ"}
    last_name_kana        {"ユウ"}
  end
end