# DB設計
![データベース ER 図](https://user-images.githubusercontent.com/66294265/86111607-ee900a00-bb01-11ea-8781-e9d935bbd33c.jpeg)


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|user_image|string||
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|

### Association
- has_many :items
- has_many :cards
- has_one :order


## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|zip_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|local|string|null: false|
|building_name|string|null: false|
|phone_number|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user



## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user



## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|string|null: false|
|text|string|null: false|
|status|string|null: false|
|size|string|null: false|
|shipping_fee|string|null: false|
|shipping_date|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|


### Association
- has_many :images
- belongs_to :user
- belongs_to :category
- belongs_to :brand


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||


### Association
- has_many :items



## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||



### Association
- has_many :items


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|image_id|integer|null: false, foreign_key: true|



### Association
- belongs_to :item
