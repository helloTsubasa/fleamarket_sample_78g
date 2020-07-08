class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :text, null: false
      t.string :status, null: false
      t.integer :size_id, null: false
      t.string :shipping_fee, null: false
      t.integer :shipping_date, null: false
      t.integer :category_id, foreign_key: true, null: false
      t.integer :brand_id, foreign_key: true
      t.integer :user_buyer_id, foreign_key: true
      t.integer :user_seller_id, foreign_key: true, fnull: false

      t.timestamps
    end
  end
end
