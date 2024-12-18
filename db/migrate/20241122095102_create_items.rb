class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :item_category_id, null: false
      t.integer :item_condition_id, null: false
      t.integer :item_postage_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :item_shipping_time_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
