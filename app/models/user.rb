class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable, :rememberable
  devise :database_authenticatable, :registerable, :validatable
  after_create :create_profile
  has_one :profile, dependent: :destroy
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :followings
  has_many :followed_users, through: :followings, source: :followed_user


  private

  def create_profile
    Profile.create(user_id: self.id, username: self.email.split("@")[0])
  end
end
