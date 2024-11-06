class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_articles, through: :bookmarks, source: :article
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  has_one_attached :icon


  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  def self.ransackable_attributes(auth_object = nil)
    [ "name" ]
  end

  def my_profile
  end

  def my_article?(article)
    self == article.user
  end

  def can_edit?(article)
  return false unless self # selfがnilなら、未ログインと判断してfalseを返す
  my_article?(article)
  end

  def my_comment?(comment)
    self == comment.user
  end

  def bookmark(article)
    bookmark_articles << article
  end

  def unbookmark(article)
    bookmark_articles.destroy(article)
  end

  def bookmark?(article)
    bookmark_articles.include?(article)
  end

  def icon_webp
    icon.variant(format: :webp).processed
  end
end
