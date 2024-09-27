class Article < ApplicationRecord
  validates :title, presence: true
  validates :image, presence: true
  validates :oshi_point, presence: true, length: { maximum: 255 }
  enum category: { other: 0, stage: 1, voice_actor: 2, idol: 3}
end
