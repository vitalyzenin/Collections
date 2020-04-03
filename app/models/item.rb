class Item < ApplicationRecord
  searchkick word_middle: [:name, :tag], language: "english"

  def search_data
    {
      name: name,
      collection_descr: rich_for_searchs.body,
    }
  end

#  include Elasticsearch::Model
#  include Elasticsearch::Model::Callbacks

#  settings do
#    mappings dynamic: false do
#      indexes :name, type: :text, analyzer: :simple
#      indexes :rich_record do
#        indexes :body, type: :text, analyzer: :snowball
#      end
#    end
#  end

#  def as_indexed_json(options={})
#    self.as_json(
#      include: { rich_record: { only: :body },
#                  rich_record: { only: :body }
#               })
#  end

#  def self.my_search(query)
#    self.search({
#      query: {
#        bool: {
#          should: [
#          {
#            multi_match: {
#              query: query,
#              fields: [:name, :body]
#            }
#          }]
#        }
#      }
#    })
#  end

  belongs_to :collection
  has_many :rich_for_searchs, as: :rich_record
  acts_as_taggable_on :tags
  validates :name, presence: true, uniqueness: { scope: :collection_id }, length: { minimum: 3 }
end
