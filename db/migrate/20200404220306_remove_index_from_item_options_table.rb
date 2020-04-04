class RemoveIndexFromItemOptionsTable < ActiveRecord::Migration[6.0]
  def change
    change_table(:item_options) do |t|
      t.remove_index [ :owner_type, :owner_id ]
    end
  end
end
