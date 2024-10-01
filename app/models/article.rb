class Article < ApplicationRecord
  belongs_to :user 
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :oshi_point, presence: true, length: { maximum: 255 }
  has_many_attached :images
  enum category: { other: 0, stage: 1, voice_actor: 2, idol: 3}
end
