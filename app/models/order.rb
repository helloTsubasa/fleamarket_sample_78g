class Order < ApplicationRecord
  belongs_to :user, optional: true
  validates :family_name, :first_name, :family_name_kana, :first_name_kana,:zip_code, :prefecuture,:city, :local,presence: true
end
