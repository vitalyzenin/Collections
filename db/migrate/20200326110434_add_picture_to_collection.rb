class AddPictureToCollection < ActiveRecord::Migration[6.0]
  def change
    add_column :collections, :picture, :string
  end
end
