FactoryBot.define do
  factory :user do
    nickname { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { "password1" } # Faker のランダム性を避けるため固定値
    password_confirmation { password }
    last_name { "山田" } # 漢字やカタカナを使用したい場合はカスタマイズが必要
    first_name { "太郎" }
    last_name_kana { "ヤマダ" } # カタカナ固定値。ランダム生成が必要なら独自のメソッドを利用。
    first_name_kana { "タロウ" }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
