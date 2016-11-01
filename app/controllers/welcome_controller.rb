class WelcomeController < ApplicationController
  def index
  end

  def show
    @tracks = current_user.soundcloud_client.get("/me/tracks", :limit => 5)
    @me     = current_user.soundcloud_client.get("/me")
    @favs   = current_user.soundcloud_client.get("/me/favorites", :limit => 5)
    @fol    = current_user.soundcloud_client.get("/me/followings", :limit => 5)
    @fols   = current_user.soundcloud_client.get("/me/followers", :limit => 5)
  end

  def update
    res = current_user.soundcloud_client.put("/me", :user => {:description => params[:description]})
    redirect_to :action => :show
  end
end
