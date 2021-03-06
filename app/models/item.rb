class Item < ApplicationRecord
  acts_as_taggable_on :tags
  searchkick word_middle: [:name, :collection_name, :collection_descr, :name_tagged, :item_options, :item_value_str, :item_value_text],
            language: "english", callbacks: :async

  scope :search_import, -> { includes(:tags) }

  def search_data
    {
      name: name,
      collection_name: collection.name,
      collection_descr: rich_for_search&.body,
      item_options: item_options.pluck(:name),
      item_value_str: item_option_values.pluck(:str_content),
      item_value_text: item_option_values.pluck(:text_content),
      name_tagged: "#{name} #{tags.map(&:name).join(" ")}"
    }
  end

  belongs_to :collection
  has_one :rich_for_search, :through => :collection
  has_many :item_options, :through => :collection

  has_many :item_option_values, dependent: :destroy
  accepts_nested_attributes_for :item_option_values, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, uniqueness: { scope: :collection_id, case_sensitive: true }, length: { minimum: 3 }
end
