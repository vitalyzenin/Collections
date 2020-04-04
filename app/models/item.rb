class Item < ApplicationRecord
  searchkick word_middle: [:name, :collection_name, :collection_descr], language: "english"

  def search_data
    {
      name: name,
      collection_name: collection.name,
      collection_descr: rich_for_search&.body
    }
  end

  belongs_to :collection
  has_one :rich_for_search, :through => :collection
  has_many :item_options, as: :owner, :through => :collection

  acts_as_taggable_on :tags
  validates :name, presence: true, uniqueness: { scope: :collection_id }, length: { minimum: 3 }
end
