class User < ActiveRecord::Base
  cattr_accessor :t, :b
  SOUNDCLOUD_CLIENT_ID     = "7355a6cba0f846959340a3465be66b46"
  SOUNDCLOUD_CLIENT_SECRET = "45180b9608c61f7bd65bce959801d377"
  #USER_NAME
  #PASS_WORD

  def self.soundcloud_client(options={})
    
    options = {
      :client_id     => SOUNDCLOUD_CLIENT_ID,
      :client_secret => SOUNDCLOUD_CLIENT_SECRET,
      :username => "#{t}" , 
      :password => "#{b}"
    }.merge(options)

    Soundcloud.new(options)
  end
  
  
  def soundcloud_client(options={})
    options= {
      :expires_at    => soundcloud_expires_at,
      :access_token  => soundcloud_access_token,
      :refresh_token => soundcloud_refresh_token
    }.merge(options)
    
    client = self.class.soundcloud_client(options)
    
    
    
    #var myjson=JSON.parse(curl -v 'http://api.soundcloud.com/resolve.json?url=http://soundcloud.com/matas/hobnotropic&client_id=375245a25ba953ab5ca4d80110a71d61')
    #hash=JSON.parse 
    
    #@me=json_decode(@soundcloud => get('me').true);
    # define a callback for successful token exchanges
    # this will make sure that new access_tokens are persisted once an existing 
    # access_token expired and a new one was retrieved from the soundcloud api
    client.on_exchange_token do
      self.update_attributes!({
        :soundcloud_access_token  => client.access_token,
        :soundcloud_refresh_token => client.refresh_token,
        :soundcloud_expires_at    => client.expires_at,
      })
    end
    
    client
  end
end
