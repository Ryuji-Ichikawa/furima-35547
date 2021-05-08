FactoryBot.define do
  factory :item do
    name                    { Faker::Name.initials(number: 4) }
    info                    { 'test' }
    category_id             { '1' }
    status_id               { '1' }
    shipping_fee_id         { '1' }
    prefecture_id           { '1' }
    scheduled_delivery_id   { '1' }
    price                   { '500' }
    association :user
  end
end
