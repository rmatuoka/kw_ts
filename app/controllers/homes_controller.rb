class HomesController < ApplicationController
  layout "home"
  
  def index
    @user = User.new
    
    @user_session = UserSession.new
    
  end
    
end
