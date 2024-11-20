# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false, unique: true |
| password            | string | null: false |
| last_name_kanji     | string | null: false |
| first_name_kanji    | string | null: false |
| last_name_kana      | string | null: false |
| first_name_kana     | string | null: false |
| last_name_hiragana  | string | null: false |
| first_name_hiragana | string | null: false |
| birth_date          | date   | null: false |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| name                  | string     | null: false |
| description           | text       | null: false |
| item_category_id      | integer    | null: false |
| item_condition_id     | integer    | null: false |
| item_postage_id       | integer    | null: false |
| prefecture_id         | integer    | null: false |
| item_shipping_time_id | integer    | null: false |
| price                 | integer    | null: false |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type        | Options                        |
| ------ | ----------- | ------------------------------ |
| user   | referrences | null: false, foreign_key: true |
| item   | referrences | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type        | Options     |
| ------------- | ----------- | ----------- |
| purchase      | referrences | null: false, foreign_key: true |
| postal_code   | string      | null: false |
| prefecture_id | integer     | null: false |
| city          | string      | null: false |
| address       | string      | null: false |
| building      | string      |             |
| phone_number  | string      | null: false |

### Association

- belongs_to :purchase