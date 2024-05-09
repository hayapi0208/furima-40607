FactoryBot.define do
  factory :item do
    item               { Faker::Lorem.sentence }
    item_comment       { Faker::Lorem.sentence }
    item_category_id   { Faker::Number.between(from: 2, to: 11) }
    item_condition_id  { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    delivery_tame_id   { Faker::Number.between(from: 2, to: 4) }
    price              { Faker::Number.between(from: 2, to: 9999999) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
