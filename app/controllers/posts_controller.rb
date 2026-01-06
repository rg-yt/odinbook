class PostsController < ApplicationController
  def index
    @posts = Post.post_feed(current_user)
  end
end
