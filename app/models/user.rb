class User < ApplicationRecord
  has_many :items,  dependent: :destroy
  has_one  :order,  dependent: :destroy
  has_one  :card,  dependent: :destroy
  has_many :comments
  has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, presence: true, length: { minimum: 7 }
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_day, presence: true
  has_one :order
end
