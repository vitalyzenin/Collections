class AddColumnsIntoUserTable < ActiveRecord::Migration[6.0]
  def change
    add_column(:users, :name, :string)
    add_column(:users, :admin, :boolean, default: false, null: false)
    add_column(:users, :blocked, :boolean, default: false, null: false)
  end
end
