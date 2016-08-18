class Admin::StaticsController < ApplicationController     
  access_control do
      allow :administrator, :all
  end
  
  layout "admin"
  
  def index 
    
  end
end
