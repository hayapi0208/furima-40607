FactoryBot.define do
  factory :order_address do
    post_code      { '123-4567' }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    municipalities { Faker::Lorem.sentence }
    street_address { Faker::Lorem.sentence }
    building       { Faker::Lorem.sentence }
    telephone      { '09012345678' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
