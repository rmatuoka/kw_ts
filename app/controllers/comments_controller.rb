class CommentsController < ApplicationController
  access_control do
    allow logged_in
  end
  
  def create
    @error = true
    @feed = params[:comment][:feed_id].to_i
    
    if params[:comment][:comment].present?
      @comment = Comment.new
      @comment.feed_id = @feed
      @comment.user_id = current_user.id
      @comment.comment = params[:comment][:comment]
    
      if @comment.save
        @error = false
      end
    end
  end
end
