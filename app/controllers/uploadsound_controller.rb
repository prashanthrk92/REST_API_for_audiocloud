class UploadsoundController < ApplicationController
  def redirect
    #render :file => 'app\views\upload\uploadfile.rhtml'
  end

  def upload
    uploaded_io = params[:upload]
    @path = uploaded_io.path
    @upload=current_user.soundcloud_client.post('/tracks', :track => 
      {
      :title => params[:title], :asset_data => File.new(@path,'rb'), :downloadable=>:true
      }
      )
  end
end
