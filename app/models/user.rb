class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  def my_article?(article)
    self == article.user
  end

  def my_comment?(comment)
    self == comment.user
  end
end
