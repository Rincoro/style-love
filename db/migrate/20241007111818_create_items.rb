class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :brand
      t.string :store_url
      t.integer :category, default: 0, null: false
      t.timestamps
    end
  end
end
