FactoryBot.define do
  factory :purchase_address do
    user_id { 1 }
    postal_code { "200-3000" }
    city{ '東京' }
    address{ '渋谷' }
    building { '東京ハイツ' }
    phone_number{ 12345678900 }
    prefecture_id{ 1 }
  end
end
