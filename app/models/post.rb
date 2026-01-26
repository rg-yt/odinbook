class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, as: :likable

  scope :post_feed, ->(current_user) { Post.where(user_id: current_user.followed_user_ids + [ current_user.id ]).order(created_at: :desc) }
  after_create_commit { broadcast_prepend_to "posts" }
end
