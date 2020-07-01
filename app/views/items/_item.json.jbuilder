json.extract! item, :id, :name, :price, :text, :status, :size, :shipping_fee, :shipping_date, :user_id, :category_id, :brand_id, :created_at, :updated_at
json.url item_url(item, format: :json)
