class Collection < ApplicationRecord
  extend Enumerize
  mount_uploader :picture, MyUploader
  belongs_to :user

  has_many :items, dependent: :destroy
  has_rich_text :content
  has_one :rich_for_search, as: :record

  has_many :item_options, as: :owner, dependent: :destroy
  accepts_nested_attributes_for :item_options, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, uniqueness: { scope: :user_id }, length: { minimum: 3 }

  enumerize :theme, in: [:Alcohol, :Animals, :Badges, :Balls,
                        :Books, :Calendars, :Cards, :Coins,
                        :Figurines, :Gems, :Keys, :Marks,
                        :Shells, :Tickets, :Toys, :Trinkets]
end
