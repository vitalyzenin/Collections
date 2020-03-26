class AddThemeToCollection < ActiveRecord::Migration[6.0]
  def change
    add_column(:collections, :theme, :string)
  end
end
