class Item < ApplicationRecord
  belongs_to :user_buyer, class_name: 'User', :foreign_key => 'user_buyer_id'
  belongs_to :user_seller, class_name: 'User', :foreign_key => 'user_seller_id'
  belongs_to :category
  belongs_to :brand
end
