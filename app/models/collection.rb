class Collection < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: { scope: :user_id }, length: { minimum: 3 }

  enum theme: {
    Alcohol: "Alcohol",
    Animals: "Animals",
    Badges: "Badges",
    Balls: "Balls",
    Books: "Books",
    Calendars: "Calendars",
    Cards: "Cards",
    Coins: "Coins",
    Figurines: "Figurines",
    Gems: "Gems",
    Keys: "Keys",
    Marks: "Marks",
    Shells: "Shells",
    Tickets: "Tickets",
    Toys: "Toys",
    Trinkets: "Trinkets"
  }

  mount_uploader :picture, ColPictureUploader
end
