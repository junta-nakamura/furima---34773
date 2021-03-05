FactoryBot.define do
  factory :item do
    product_name       {Faker::Commerce.product_name}
    detail             {Faker::Lorem.paragraph}
    category_id        {Faker::Number.between(from: 1, to: 11)}
    status_id          {Faker::Number.between(from: 1, to: 6)}
    delivery_fee_id    {Faker::Number.between(from: 1, to: 2)}
    prefectures_id     {Faker::Number.between(from: 1, to: 47)}
    days_id            {Faker::Number.between(from: 1, to: 3)}
    price              {Faker::Number.between(from: 300, to: 9999999)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end