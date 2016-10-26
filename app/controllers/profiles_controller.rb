class ProfilesController < ApplicationController
  def index
    #Load FEED
    @feed = Feed.all.order(created_at: "desc" )
    
    #Cria formulário de comentário
    @comment = Comment.new
    
    #Cria formulário de like
    @like = Like.new
    
  end
end
