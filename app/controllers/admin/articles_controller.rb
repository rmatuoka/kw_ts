class Admin::ArticlesController < ApplicationController
  access_control do
    allow :administrator, :all
  end
  layout "admin"

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_filter :load_categories, :load_father
  # GET /articles
  # GET /articles.json
  def index
    @articles = @columnist.articles.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = @columnist.articles.build
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = @columnist.articles.build(article_params)
    @article.columnist_id = @columnist.id
    @article.save
    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_columnist_article_path(@columnist, @article), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: admin_columnist_article_path(@columnist, @article) }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to [:admin, @article], notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @article] }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_columnist_articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :subtitle, :description, :ordem, :active, :published, :tag_list, :image_article, :columnist_id, category_ids: [])
    end

    def load_categories
      @categories = Category.where("published = true").all.collect { |c| [c.name, c.id] }
      # @categories = Admin::Category.includes(:children).where("admin_categories.published = true").all
    end

    # def load_columnists
    #   @columnists = Admin::Columnist.where("published = true").all.collect { |c| [c.name, c.id] }
    # end

    def load_father
      @columnist = Admin::Columnist.find(params[:columnist_id])
    end
end
