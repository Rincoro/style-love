class Item < ApplicationRecord
  belongs_to :article
  has_one_attached :image
  enum item_category: { tops: 0, bottoms: 1, jacket: 2, allinone: 3, dress: 4, hear_accessory: 5, accessory: 6 }

  def item_image_webp
    image.variant(resize_to_fill: [ 500, 500 ], format: :webp).processed
  end
end
