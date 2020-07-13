class ItemCategory < ApplicationRecord
  belong_to :item
  belong_to :category
end
