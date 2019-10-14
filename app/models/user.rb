class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :articles
  has_many :comments
  has_many :likes, dependent: :destroy

  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def already_liked?(article)
    self.likes.exists?(article_id: article.id)
  end
end

