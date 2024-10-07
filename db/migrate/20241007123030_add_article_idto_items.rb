class AddArticleIdtoItems < ActiveRecord::Migration[7.2]
  def change
    add_reference :items, :article, null: false, foregin_key: true
  end
end
