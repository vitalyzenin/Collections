class CreateItemOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :item_options do |t|
      t.string :name
      t.integer :int_content
      t.string :str_content
      t.date :date_content
      t.boolean :bool_content
      t.string :option_type

      t.references :owner, null: false, polymorphic: true, index: false

      t.timestamps

      t.index [ :owner_type, :owner_id ], name: "index_item_options_uniqueness", unique: true
    end
  end
end
