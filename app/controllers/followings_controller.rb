class FollowingsController < ApplicationController
  def follow
    id = params[:user_name]
    @user = current_user.soundcloud_client.get("/users/#{id}") 
    current_user.soundcloud_client.put("/me/followings/#{@user.id}")
    redirect_to you_path
  end

  def unfollow
    id = params[:user_name]
    @user = current_user.soundcloud_client.get("/users/#{id}") 
    current_user.soundcloud_client.delete("/me/followings/#{@user.id}")
    redirect_to you_path
  end
end
