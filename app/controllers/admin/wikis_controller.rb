class Admin::WikisController < ApplicationController
  access_control do
    allow :administrator, :all
  end
  layout "admin"

  before_action :set_wiki, only: [:show, :edit, :update, :destroy]
  # GET /articles
  # GET /articles.json
  def index
    @wikis = Wiki.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @wiki = Wiki.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.save
    respond_to do |format|
      if @wiki.save
        

        format.html { redirect_to admin_wiki_path(@wiki), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: adminwiki_path(@wiki) }
      else
        format.html { render :new }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @wiki.update(wiki_params)
        format.html { redirect_to admin_wiki_path(@wiki), notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @wiki] }
      else
        format.html { render :edit }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @wiki.destroy
    respond_to do |format|
      format.html { redirect_to admin_wikis_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki
      @wiki = Wiki.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wiki_params
      params.require(:wiki).permit(:title,:description,:active, :published, enterprise_ids_ids: [])
    end
end
