require 'soundcloud'
class DownloadsoundController < ApplicationController
  def dwnld
       url = params[:download]
       curl = '/tracks/'+url
       track1 = current_user.soundcloud_client.get(curl)
       #download_url = current_user.soundcloud_client.get(track1.download_url, :allow_redirects => true)
       #File.open("/public/download/a.mp3", "wb") do |saved_file|
       # the following "open" is provided by open-uri
       #open(track1, "rb")
       #saved_file.write(read_file.read) do |read_file|
       #end
       @ulr = track1.download_url+"?client_id=" + User.soundcloud_client.client_id.to_s + "&oauth_token" + User.soundcloud_client.access_token.to_s
     #end
     
     #redirect_to :action => :show , :controller => :welcome
  end
end
