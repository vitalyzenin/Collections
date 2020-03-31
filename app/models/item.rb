class Item < ApplicationRecord
  belongs_to :collection
  acts_as_taggable_on :tags
  validates :name, presence: true, uniqueness: { scope: :collection_id }, length: { minimum: 3 }
end
