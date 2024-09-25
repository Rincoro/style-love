class Article < ApplicationRecord
  validates :title, presence: true
  validates :image, presence: true
  validates :oshi_point, presence: true, length: { maximum: 255 }
  enum category: { その他: 0, 舞台: 1, 声優: 2, アイドル: 3}
end
