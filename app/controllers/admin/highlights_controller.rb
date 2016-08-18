class Admin::HighlightsController < ApplicationController
  layout "admin"
  before_action :set_admin_highlight, only: [:show, :edit, :update, :destroy]
  access_control do
      allow :administrator, :all
  end
  # GET /admin/highlights
  # GET /admin/highlights.json
  def index
    @admin_highlights = Admin::Highlight.all
  end

  # GET /admin/highlights/1
  # GET /admin/highlights/1.json
  def show
  end

  # GET /admin/highlights/new
  def new
    @admin_highlight = Admin::Highlight.new
  end

  # GET /admin/highlights/1/edit
  def edit
  end

  # POST /admin/highlights
  # POST /admin/highlights.json
  def create
    @admin_highlight = Admin::Highlight.new(admin_highlight_params)

    respond_to do |format|
      if @admin_highlight.save
        format.html { redirect_to @admin_highlight, notice: 'Highlight was successfully created.' }
        format.json { render :show, status: :created, location: @admin_highlight }
      else
        format.html { render :new }
        format.json { render json: @admin_highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/highlights/1
  # PATCH/PUT /admin/highlights/1.json
  def update
    respond_to do |format|
      if @admin_highlight.update(admin_highlight_params)
        format.html { redirect_to @admin_highlight, notice: 'Highlight was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_highlight }
      else
        format.html { render :edit }
        format.json { render json: @admin_highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/highlights/1
  # DELETE /admin/highlights/1.json
  def destroy
    @admin_highlight.destroy
    respond_to do |format|
      format.html { redirect_to admin_highlights_url, notice: 'Highlight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_highlight
      @admin_highlight = Admin::Highlight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_highlight_params
      params.require(:admin_highlight).permit(:title, :subtitle, :ordem, :active, :published, :link, :image_highlight, :visualizations)
    end
end
