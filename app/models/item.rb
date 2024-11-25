class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :item_postage
  belongs_to :prefecture
  belongs_to :item_shipping_time

  has_one_attached :image # 商品画像を1枚必須にする

  # 商品名が必須であること
  validates :name, presence: true

  # 商品の説明が必須であること
  validates :description, presence: true

  # カテゴリーの情報が必須であること
  validates :item_category_id, numericality: { other_than: 1, message: "can't be ---" }

  # 商品の状態が必須であること
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be ---" }

  # 配送料の負担が必須であること
  validates :item_postage_id, numericality: { other_than: 1, message: "can't be ---" }

  # 発送元の地域が必須であること
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be ---" }

  # 発送までの日数が必須であること
  validates :item_shipping_time_id, numericality: { other_than: 1, message: "can't be ---" }

  # 価格が必須であること
  validates :price, presence: true

  # 価格が範囲内であること（300以上9999999以下）
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid" }

  # 商品画像が必須であること
  validates :image, presence: true
end