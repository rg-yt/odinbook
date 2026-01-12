class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable, :rememberable
  devise :database_authenticatable, :registerable, :validatable
  devise :omniauthable, omniauth_providers: [ :google_oauth2 ]
  after_create :create_profile
  has_one :profile, dependent: :destroy
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :followings
  has_many :followed_users, through: :followings, source: :followed_user


  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data["email"]).first
    unless user
        user = User.create(
           email: data["email"],
           password: Devise.friendly_token[0, 20]
        )
    end
    user
  end
  private

  def create_profile
    Profile.create(user_id: self.id, username: self.email.split("@")[0])
  end
end
