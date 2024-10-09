class RenameCategoryColumnToItems < ActiveRecord::Migration[7.2]
  def change
    rename_column :items, :category, :item_category
  end
end
