class DropTheTestedTableItemOptions < ActiveRecord::Migration[6.0]
  def change
    drop_table(:item_options)
  end
end
