class ProfilesController < ApplicationController
  def index
    #Load FEED
    @feed = Feed.all.order(created_at: "desc" )
    
    #Checa porcentagem do perfil 
    
    
  end
end
