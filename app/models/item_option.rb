class ItemOption < ApplicationRecord
  self.table_name = "item_options"
  belongs_to :owner, polymorphic: true

  enumerize :option_type, in: [:integer, :string, :text, :date, :bool]
  validates :name, presence: true, length: { minimum: 3 }
end
