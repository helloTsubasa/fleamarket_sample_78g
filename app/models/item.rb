class Item < ApplicationRecord
  belongs_to :user_buyer, class_name: 'User', :foreign_key => 'user_buyer_id', optional: true,dependent: :destroy
  belongs_to :user_seller, class_name: 'User', :foreign_key => 'user_seller_id'
  belongs_to :category
  belongs_to :brand, optional: true
  has_many :images,dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  # validates :images, presence: true
  # validates :name, presence: true
end
