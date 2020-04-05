class AddTextContentIntoItemOptionValues < ActiveRecord::Migration[6.0]
  def change
    add_column :item_option_values, :text_content, :text
  end
end
