FactoryBot.define do
  factory :address_deal do
    postal_code        {"193-1832"}
    prefecture_id      {Faker::Number.between(from: 1, to: 47)}
    municipalities     {"八王子市"}
    house_number       {"八王子市"}
    phone              {"08058683435"}
    token              {1}
  end
end