class AddIndexInItemOptionsTable < ActiveRecord::Migration[6.0]
  def change
    change_table(:item_options) do |t|
      t.index [ :owner_type, :owner_id, :name ], name: "index_item_options_uniqueness", unique: true
    end
  end
end
