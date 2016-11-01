class ComlikeController < ApplicationController
  def comment
   @url = params[:comment]
   @track = current_user.soundcloud_client.get("/tracks/#{@url}")
   @comment = current_user.soundcloud_client.get("/tracks/#{@url}/comments")
   raise @cm = @comment.first.body
  rescue
  end
  
  def postcomment
    @tid = params[:pcomment]
    #@comment2 = current_user.soundcloud_client.get("/tracks/#{@tid}/comments")
    
    #raise cid = @comment2.first.id 
    #current_user.soundcloud_client.put("/tracks/#{@tid}/comments/#{cid}" , :comment => {
                           #:body => params[:comment3],
                           
                           #})
   #rescue Soundcloud::ResponseError => e
      #if e.response.status == '404'
        @comment1 = current_user.soundcloud_client.post("/tracks/#{@tid}/comments/", :comment => {
                           :body => params[:comment3],
                           
                           })
      #end
  
   #rescue
      
    redirect_to :action => :comment , :comment => @tid
    
  end

  def like
    url = '/tracks/' + params[:like]
    track = current_user.soundcloud_client.get(url)
    lurl = "/me/favorites/#{track.id}"
    suc = current_user.soundcloud_client.put(lurl)
    redirect_to you_path
  end
end
