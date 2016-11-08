class WikiController < ApplicationController
  def index
    #CArrega todos os termos que comecem com numero

  end
  
  def show
    @wikis = Wiki.where(["title LIKE ?", "#{params[:id]}%"])
    
    puts "WIKI===================#{@wikis.inspect}"
  end
end
