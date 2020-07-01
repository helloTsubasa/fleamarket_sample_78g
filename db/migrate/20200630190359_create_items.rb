class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :price, null: false
      t.string :text, null: false
      t.string :status, null: false
      t.string :size, null: false
      t.string :shipping_fee, null: false
      t.integer :shipping_date, null: false

      t.timestamps
    end
  end
end
