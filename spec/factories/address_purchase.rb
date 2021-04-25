FactoryBot.define do
  factory :address_purchase do
    postal_code {Faker::Lorem.characters(number: 3, min_numeric: 3) + '-' + Faker::Lorem.characters(number: 4, min_numeric: 4) }
    prefecture_id {Faker::Number.between(from: 2, to: 48)} # 2〜48がランダムに表示
    town { Gimei.address.city.kanji}
    address {Faker::Address.street_address} 
    phone_number {Faker::Lorem.characters(number: 11, min_numeric: 11)} 
  end
end