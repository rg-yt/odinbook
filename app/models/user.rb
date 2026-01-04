class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable, :rememberable
  devise :database_authenticatable, :registerable, :validatable
  has_many :posts
  has_many :comments
  has_many :followings
  has_many :followed_users, through: :followings, source: :followed_user
end
