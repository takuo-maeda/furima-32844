FactoryBot.define do
  factory :item do
    item_name {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    description {Faker::Lorem.characters(number: 100, min_alpha: 1, min_numeric: 1) }
    category_id {Faker::Number.between(from: 2, to: 11)} # 2〜11のいずれかがランダムに表示
    status_id {Faker::Number.between(from: 2, to: 6)} # 2〜6がランダムに表示
    prefecture_id {Faker::Number.between(from: 2, to: 48)} # 2〜48がランダムに表示
    delivery_fee_payment_id {Faker::Number.between(from: 2, to: 3)} # 2〜3がランダムに表示
    delivery_prepare_id {Faker::Number.between(from: 2, to: 4)} # 2〜4のいずれかがランダムに表示
    price {Faker::Number.between(from: 1, to: 9999999)} # 1〜9999999のいずれかがランダムに表示
    association :user
  end
end
