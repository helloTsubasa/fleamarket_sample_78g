class User < ApplicationRecord
  
  has_many :user_buyer_items, class_name: 'Item', :foreign_key => 'user_buyer_id'
  has_many :user_seller_items, class_name: 'Item', :foreign_key => 'user_seller_id'
  has_one  :order,  dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_day, presence: true

end
