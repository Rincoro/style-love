class AddColorToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :color, :integer
  end
end
