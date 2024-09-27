class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.integer :category, default: 0, null: false
      t.string :oshi_point
      t.timestamps
    end
  end
end
