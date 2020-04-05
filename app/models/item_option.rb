class ItemOption < ApplicationRecord
  extend Enumerize
  belongs_to :collection

  enumerize :option_type, in: [:integer, :string, :text, :date, :bool]
  validates :name, presence: true, uniqueness: { case_sensitive: true }, length: { minimum: 3 }
end
