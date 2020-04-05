class CreateItemOptionValues < ActiveRecord::Migration[6.0]
  def change
    create_table :item_option_values do |t|
      t.integer :int_content
      t.string :str_content
      t.date :date_content
      t.boolean :bool_content

      t.references :item_option, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
