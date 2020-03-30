class SetDefaultToUsersName < ActiveRecord::Migration[6.0]
  def change
    change_table(:users) do |t|
      t.change_default(:name, nil)
    end
  end
end
