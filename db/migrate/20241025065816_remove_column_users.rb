class RemoveColumnUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :introduction, :integer
  end
end
