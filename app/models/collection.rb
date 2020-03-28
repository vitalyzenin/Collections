class Collection < ApplicationRecord
  extend Enumerize
  mount_uploader :picture, MyUploader
  belongs_to :user
  validates :name, presence: true, uniqueness: { scope: :user_id }, length: { minimum: 3 }

  enumerize :theme, in: [:Alcohol, :Animals, :Badges, :Balls,
                        :Books, :Calendars, :Cards, :Coins,
                        :Figurines, :Gems, :Keys, :Marks,
                        :Shells, :Tickets, :Toys, :Trinkets]
end
