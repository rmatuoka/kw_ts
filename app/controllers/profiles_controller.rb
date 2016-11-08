class ProfilesController < ApplicationController
  access_control do
    allow logged_in
  end
  
  def index
    #Load FEED
    @feed = Feed.all.order(created_at: "desc" )
    
    #Cria formulário de comentário
    @comment = Comment.new
    
    #Cria formulário de like
    @like = Like.new
    
  end
end
