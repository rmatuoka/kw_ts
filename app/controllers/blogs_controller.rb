class BlogsController < ApplicationController
  def index
    #------------------INSERIR EM UM BEFORE FILTER
    #Carrega artigos dos colunistas
    @columnists = Admin::Columnist.includes(:articles).where(["published = 1 AND active = 1"])
    @categories = Category.where(["active = true AND published = true"])
    #------------------INSERIR EM UM BEFORE FILTER FIM
  
    #Carrega artigos
    @destaque = Article.where(["published = 1 AND active = 1 AND position = 1"]).order(:created_at => "asc").limit(1)
    puts "===========DESTAQUE: #{@destaque.inspect}"
    
    @direita = Article.where(["published = 1 AND active = 1 AND position = 2"]).order(:created_at => "asc").limit(3)
    puts "===========DIREITA: #{@direita.inspect}"
    
    @outros = Article.where(["published = 1 AND active = 1 AND position = 3"]).order(:created_at => "asc").limit(6)
    puts "===========OUTROS: #{@outros.inspect}"
    
    
  end
  
  def show
    #------------------INSERIR EM UM BEFORE FILTER
    #Carrega artigos dos colunistas
    @columnists = Admin::Columnist.includes(:articles).where(["published = 1 AND active = 1"])
    @categories = Category.where(["active = true AND published = true"])
    #------------------INSERIR EM UM BEFORE FILTER FIM
    
    @article = Article.find(params[:id])
    @feed = Feed.where(["object_id = ? AND object_type =?",@article.id, "post"]).first
    
    puts "===========FEED: #{@feed.inspect}"
    
    
    if @feed.present?
      #Cria formulário de comentário
      @comment = Comment.new

      #Cria formulário de like
      @like = Like.new
      
      @total_likes = @feed.likes.all.count
      @total_comments = @feed.comments.all.count
      @liked = @feed.likes.where(["feed_id = ? AND user_id = ?", @feed.id, current_user.id]).empty?
      @comments = @feed.comments.all.order(:created_at => "desc").limit(4)
    end
    
    
  end
  
end
