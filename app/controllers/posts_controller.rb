class PostsController < ApplicationController
  def index
    @posts = Post.post_feed(current_user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: "Your post was successfully created!" }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def post_params
    params.expect(post: [ :title, :body, :user_id ])
  end
end
