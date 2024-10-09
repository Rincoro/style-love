class Item < ApplicationRecord
  belongs_to :user 
  belongs_to :article
  has_many_attached :images
  validates :name, presence: true
  validates :images, presence: true
  enum item_category: { tops: 0, bottoms: 1, jacket: 2, allinone: 3, dress: 4, hear_accessory: 5, accessory: 6}
end
