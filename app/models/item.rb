class Item < ApplicationRecord
  acts_as_taggable_on :tags
  searchkick word_middle: [:name, :collection_name, :collection_descr, :name_tagged], language: "english", callbacks: :async
  scope :search_import, -> { includes(:tags) }

  def search_data
    {
      name: name,
      collection_name: collection.name,
      collection_descr: rich_for_search&.body,
      name_tagged: "#{name} #{tags.map(&:name).join(" ")}"
    }
  end

  belongs_to :collection
  has_one :rich_for_search, :through => :collection
  has_many :item_options, :through => :collection

  validates :name, presence: true, uniqueness: { scope: :collection_id }, length: { minimum: 3 }
end
