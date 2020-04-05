class CreateTableItemOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :item_options do |t|
      t.string :name
      t.string :option_type

      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
