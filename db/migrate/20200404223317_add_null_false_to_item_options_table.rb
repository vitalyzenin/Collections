class AddNullFalseToItemOptionsTable < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:item_options, :name, false)
  end
end
