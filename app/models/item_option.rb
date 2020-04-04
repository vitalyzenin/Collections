class ItemOption < ApplicationRecord
  extend Enumerize
  self.table_name = "item_options"
  belongs_to :owner, polymorphic: true

  enumerize :option_type, in: [:integer, :string, :text, :date, :bool]
  validates :name, presence: true, length: { minimum: 3 }
end
