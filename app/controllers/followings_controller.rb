class FollowingsController < ApplicationController
  def create
    @following = current_user.followings.build(followed_user_id: params[:followed_user_id])
    if @following.save
      flash[:success] = "You've successfully followed this user"
      redirect_to users_index_path
    else
      flash.now[:error] = "Already following this user"
    end
  end

  def destroy
  end
end
