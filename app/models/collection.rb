class Collection < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 3 }
end
