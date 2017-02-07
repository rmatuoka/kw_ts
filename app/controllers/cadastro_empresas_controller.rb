class CadastroEmpresasController < ApplicationController
  layout "home"
  before_action :set_admin_enterprise, only: [:show, :edit, :update, :destroy]
  before_filter :login
  
  def index
    
  end
  
  def new
    @empresa = Admin::Enterprise.new
  end

  # POST /admin/enterprises
  # POST /admin/enterprises.json
  def create
    @empresa = Admin::Enterprise.new(admin_enterprise_params)

    respond_to do |format|
      if @empresa.save
        format.html { redirect_to cadastro_empresa_path(@empresa), notice: 'Enterprise was successfully created.' }
        format.json { render :show, status: :created, location: @admin_enterprise }
      else
        format.html { render :new }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    
  end
  
  private
    def login
      @user_session = UserSession.new
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_enterprise
      @admin_enterprise = Admin::Enterprise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_enterprise_params
      params.require(:admin_enterprise).permit(:name, :description, :img_enterprise, :banner_enterprise, :specialties, :tag_list, :address, :number, :phone, :email, :site, :featured, :city, :state, :published, speciality_ids: [])
    end
end
