FactoryBot.define do
  factory :user do
    nickname              {Faker::Name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name_kanji       {'中村'}
    first_name_kanji      {'ジュんた'}
    last_name_kana        {'カタカナ'}
    first_name_kana       {'カタカナ'}
    birthday              {Faker::Date.between(from: '2014-09-23', to: '2014-09-25')}
  end
end