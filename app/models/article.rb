class Article < ApplicationRecord
  belongs_to :user 
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :oshi_point, presence: true, length: { maximum: 255 }
  has_one_attached :image

  validates :image, presence: true
  validates :color, presence: true
  enum category: { other: 0, stage: 1, voice_actor: 2, idol: 3}
  enum color: { red: 0, pink: 1, blue: 2, light_blue: 3, yellow: 4, green: 5, 
                purple: 6, orange: 7, black: 8, white: 9, other_color: 10 }
  accepts_nested_attributes_for :items ,allow_destroy: true
end
