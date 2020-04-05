class ItemOptionValue < ApplicationRecord
  belongs_to :item
  belongs_to :item_option
end
