FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    item_category_id { Faker::Number.between(from: 2, to: 11) } # 2以上（1は「---」）
    item_condition_id { Faker::Number.between(from: 2, to: 7) } # 2以上（1は「---」）
    item_postage_id { Faker::Number.between(from: 2, to: 3) } # 2以上（1は「---」）
    prefecture_id { Faker::Number.between(from: 1, to: 47) } # 1から47
    item_shipping_time_id { Faker::Number.between(from: 2, to: 4) } # 2以上（1は「---」）
    price { Faker::Number.between(from: 300, to: 9_999_999) } # 価格を範囲内に修正
    association :user # ユーザーとの関連付け

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end