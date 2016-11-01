class SearchController < ApplicationController
  def byuser
    @id = params[:user_name]
    @usertracks = current_user.soundcloud_client.get("/users/#{@id}/tracks", :limit => 5) 
  end

  def bygenre
    @genre = params[:genre]
    @bpm   = params[:bpm]
    @genretracks = current_user.soundcloud_client.get("/tracks" , :limit => 10 , :genres => @genre , :bpm => {
                                                     :from => @bpm})
  end
end
