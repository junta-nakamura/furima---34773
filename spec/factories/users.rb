FactoryBot.define do
  factory :user do
    nickname              {Faker::Name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name_kanji       {Faker::Name}
    first_name_kanji      {Faker::Name}
  end
end


# nickname              {Faker::Name.initials(number: 2)}