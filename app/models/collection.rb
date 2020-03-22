class Collection < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: { scope: :user_id }, length: { minimum: 3 }
end
