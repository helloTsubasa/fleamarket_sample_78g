json.extract! order, :id, :family_name, :first_name, :family_name_kana, :first_name_kana, :zip_code, :prefecture, :city, :local, :building_name, :phone_number, :user_id, :created_at, :updated_at
json.url order_url(order, format: :json)
