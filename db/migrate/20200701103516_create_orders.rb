class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :zip_code, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :local, null: false
      t.string :building_name, null: false
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
