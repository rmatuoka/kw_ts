class Admin::ColumnistsController < ApplicationController
  before_action :set_admin_columnist, only: [:show, :edit, :update, :destroy]
  layout "admin"
  # GET /admin/columnists
  # GET /admin/columnists.json
  def index
    @admin_columnists = Admin::Columnist.all
  end

  # GET /admin/columnists/1
  # GET /admin/columnists/1.json
  def show
  end

  # GET /admin/columnists/new
  def new
    @admin_columnist = Admin::Columnist.new
  end

  # GET /admin/columnists/1/edit
  def edit
  end

  # POST /admin/columnists
  # POST /admin/columnists.json
  def create
    @admin_columnist = Admin::Columnist.new(admin_columnist_params)

    respond_to do |format|
      if @admin_columnist.save
        format.html { redirect_to @admin_columnist, notice: 'Admin::Columnist was successfully created.' }
        format.json { render :show, status: :created, location: @admin_columnist }
      else
        format.html { render :new }
        format.json { render json: @admin_columnist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/columnists/1
  # PATCH/PUT /admin/columnists/1.json
  def update
    respond_to do |format|
      if @admin_columnist.update(admin_columnist_params)
        format.html { redirect_to @admin_columnist, notice: 'Admin::Columnist was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_columnist }
      else
        format.html { render :edit }
        format.json { render json: @admin_columnist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/columnists/1
  # DELETE /admin/columnists/1.json
  def destroy
    @admin_columnist.destroy
    respond_to do |format|
      format.html { redirect_to admin_columnists_url, notice: 'Admin::Columnist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_columnist
      @admin_columnist = Admin::Columnist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_columnist_params
      params.require(:admin_columnist).permit(:name, :description, :published, :active, :admin_columnists)
    end
end
