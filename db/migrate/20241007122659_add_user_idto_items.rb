class AddUserIdtoItems < ActiveRecord::Migration[7.2]
  def change
    add_reference :items, :user, null: false,  foreign_key: true
  end
end
