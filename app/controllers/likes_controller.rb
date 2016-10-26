class LikesController < ApplicationController
  def create
    @feed_id = params[:like][:feed_id].to_i
    @increase = 0
    
    check = Like.where(["feed_id = ? AND user_id = ?", @feed_id, current_user.id])
    
    if check.empty?    
      @like = Like.new
      @like.feed_id = @feed_id
      @like.user_id = current_user.id
    
      if @like.save
        @increase = 1
      end
    else
      puts check.inspect
      check.first.destroy
      @increase = -1
    end
    
  end
end
