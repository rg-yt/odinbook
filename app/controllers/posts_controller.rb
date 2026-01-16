class PostsController < ApplicationController
  def index
    @posts = Post.post_feed(current_user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entitiy
    end
  end

  private

  def post_params
    params.expect(post: [ :title, :body, :user_id ])
  end
end
