class CategoriasController < ApplicationController
  access_control do
    allow logged_in
  end
  
  def show
    @category = Category.find(params[:id])
    
    #------------------INSERIR EM UM BEFORE FILTER
    #Carrega artigos dos colunistas
    @columnists = Admin::Columnist.includes(:articles).where(["published = 1 AND active = 1"])
    @categories = Category.where(["active = true AND published = true"])
    #------------------INSERIR EM UM BEFORE FILTER FIM
  
    #Carrega artigos
    @destaque = @category.articles.where(["published = 1 AND active = 1 AND position = 1"]).order(:created_at => "asc").limit(1)
    puts "===========DESTAQUE: #{@destaque.inspect}"
    
    @direita = @category.articles.where(["published = 1 AND active = 1 AND position = 2"]).order(:created_at => "asc").limit(3)
    puts "===========DIREITA: #{@direita.inspect}"
    
    @outros = @category.articles.where(["published = 1 AND active = 1 AND position = 3"]).order(:created_at => "asc").limit(6)
    puts "===========OUTROS: #{@outros.inspect}"
    
  end
end
