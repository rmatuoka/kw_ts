class Admin::EnterprisesController < ApplicationController
  layout "admin"
  before_action :set_admin_enterprise, only: [:show, :edit, :update, :destroy]
  access_control do
      allow :administrator, :all
  end
  # GET /admin/enterprises
  # GET /admin/enterprises.json
  def index
    @admin_enterprises = Admin::Enterprise.all
  end

  # GET /admin/enterprises/1
  # GET /admin/enterprises/1.json
  def show
  end

  # GET /admin/enterprises/new
  def new
    @admin_enterprise = Admin::Enterprise.new
  end

  # GET /admin/enterprises/1/edit
  def edit
  end

  # POST /admin/enterprises
  # POST /admin/enterprises.json
  def create
    @admin_enterprise = Admin::Enterprise.new(admin_enterprise_params)

    respond_to do |format|
      if @admin_enterprise.save
        format.html { redirect_to @admin_enterprise, notice: 'Enterprise was successfully created.' }
        format.json { render :show, status: :created, location: @admin_enterprise }
      else
        format.html { render :new }
        format.json { render json: @admin_enterprise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/enterprises/1
  # PATCH/PUT /admin/enterprises/1.json
  def update
    respond_to do |format|
      if @admin_enterprise.update(admin_enterprise_params)
        format.html { redirect_to @admin_enterprise, notice: 'Enterprise was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_enterprise }
      else
        format.html { render :edit }
        format.json { render json: @admin_enterprise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/enterprises/1
  # DELETE /admin/enterprises/1.json
  def destroy
    @admin_enterprise.destroy
    respond_to do |format|
      format.html { redirect_to admin_enterprises_url, notice: 'Enterprise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_enterprise
      @admin_enterprise = Admin::Enterprise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_enterprise_params
      params.require(:admin_enterprise).permit(:name, :description, :img_enterprise, :banner_enterprise, :specialties)
    end
end
