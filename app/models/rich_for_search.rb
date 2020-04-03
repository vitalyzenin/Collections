class RichForSearch < ApplicationRecord
  self.table_name = "action_text_rich_texts"
  belongs_to :record, polymorphic: true
end
