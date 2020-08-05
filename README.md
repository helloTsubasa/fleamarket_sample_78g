<h1>FURIMA</h1>
## :link: アプリケーションの概要
<ul>
  <li>フリーマーケットサイトです。</li>
  <li>TECH CAMP 78期短期集中コースEチームで作成。</li>
  <li>作成期間 2020/6/29 ~ 2020/7/20</li>
</ul>

## :globe_with_meridians: 本番環境
<ul>
  <li>URL : http://54.95.108.70/</li>
  <li>ID/Pass</li>
  <ul>
    <li>ID : admin</li>
    <li>Pass : password78g</li>
  </ul>
  <li>テスト用アカウント等</li>
  <ul>
    <li>購入者用</li>
    <ul>
      <li>メールアドレス : buyer_user@gmail.com</li>
      <li>パスワード : 1234567</li>
        <ul>
          <li>メールアドレス : buyer_user@gmail.com</li>
          <li>パスワード : 1234567</li>
        </ul>
    </ul>
    <li></li>
  </ul>
</ul>



購入用カード情報
番号： 4242424242424242
期限： 2 / 22
セキュリティコード：123
出品者用
メールアドレス名: seller_user@gmail.com
パスワード: 1234567


## :bust_in_silhouette: テスト用アカウント等
<ul>○ 出品者用
  <li>メールアドレス: test@gmail.com</li>
  <li>パスワード: aaaaaaa</li>
</ul>
<ul>○ 購入者用
  <li>メールアドレス: test2@gmail.com</li>
  <li>パスワード: aaaaaaa</li>
</ul>
<ul>○ 購入用カード情報
  <li>番号： 4242424242424242</li>
  <li>期限： 04/26</li>
  <li>セキュリティコード：123</li>
</ul>

## :page_facing_up: 説明資料
https://docs.google.com/document/d/1Ba3vfh8clxtgb0heOh2vzRfitn2dVoTw2nkd1kFBYHo/edit?usp=sharing

## :link: アプリケーションの機能
<ul>
  <li>新規会員登録・ログインをすると商品の購入、出品が可能。</li>
  <li>新規会員登録、ログインがお済みでない方も商品の一覧、詳細を閲覧可能。</li>
  <li>決済方法はご自身のクレジットカードのみ。</li>
</ul>

## :link: 開発環境

<p align="center">
  <a href="https://www.ruby-lang.org/ja/"><img src="https://user-images.githubusercontent.com/39142850/71774533-1ddf1780-2fb4-11ea-8560-753bed352838.png" width="45px;" /></a>
  <a href="https://railsguides.jp/getting_started.html"><img src="https://y-hilite.com/wp-content/uploads/2018/02/rails_logo.png" height="45px;" /></a>
  <a href="http://haml.info/"><img src="https://user-images.githubusercontent.com/39142850/71774618-b32edb80-2fb5-11ea-9050-d5929a49e9a5.png" height="45px;" /></a>
  <a href="https://sass-lang.com/"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Sass_Logo_Color.svg/144px-Sass_Logo_Color.svg.png" height="40px;" /></a>
  <a href="https://jquery.com/"><img src="https://user-images.githubusercontent.com/66232530/88712858-58c5ba00-d155-11ea-9314-fa1a6d3442fc.png" height="50px;" /></a>
  <a href="https://github.co.jp/"><img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" height="45px;" /></a>
  <a href="https://aws.amazon.com/jp/"><img src="https://d0.awsstatic.com/logos/powered-by-aws.png" height="45px;" /></a>
</p>

# DB設計
![フリマアプリ - データベース ER 図](https://user-images.githubusercontent.com/66294265/88257900-cc04a180-ccf9-11ea-8fac-f136c28c9c72.png)


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|avatar|string||
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|

### Association
- has_many :items
- has_many :comments
- has_one :cards
- has_one :order


## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|zip_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|local|string|null: false|
|building_name|string|null: false|
|phone_number|string|null: false|
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|text|text||

### Association
- belongs_to :user
- belongs_to :item



## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_token|string|null: false|

### Association
- belongs_to :user



## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|text|string|null: false|
|status|string|null: false|
|size|string|null: false|
|shipping_fee|string|null: false|
|shipping_date|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|foreign_key: true|


### Association
- has_many :images
- has_many :comments
- belongs_to :categories
- belongs_to :user
- belongs_to :category
- belongs_to :brand



## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||


### Association
- has_many :items, through: :item_categories
- has_ancestry



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
|item_id|integer|null: false, foreign_key: true|



### Association
- belongs_to :item
