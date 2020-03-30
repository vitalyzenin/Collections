class Item < ApplicationRecord
  belongs_to :collection
  validates :name, presence: true, uniqueness: { scope: :collection_id }, length: { minimum: 3 }
end
