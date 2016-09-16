class Admin::PortfoliosController < ApplicationController
  access_control do
    allow :administrator, :all
  end 
  layout "admin"
  
  before_filter :load_father 
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  # GET /admin/portfolios
  # GET /admin/portfolios.json
  def index
    @portfolios = @admin_enterprise.portfolios.all
  end

  # GET /admin/portfolios/1
  # GET /admin/portfolios/1.json
  def show
  end

  # GET /admin/portfolios/new
  def new
    @portfolio = @admin_enterprise.portfolios.build
  end

  # GET /admin/portfolios/1/edit
  def edit
  end

  # POST /admin/portfolios
  # POST /admin/portfolios.json
  def create
    @portfolio = @admin_enterprise.portfolios.build(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to admin_enterprise_portfolio_path(@admin_enterprise, @portfolio), notice: 'Portfolio was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/portfolios/1
  # PATCH/PUT /admin/portfolios/1.json
  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to admin_enterprise_portfolio_path(@admin_enterprise, @portfolio), notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/portfolios/1
  # DELETE /admin/portfolios/1.json
  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to admin_enterprise_portfolios_path, notice: 'Portfolio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:title, :ordem, :enterprise_id, :active, :published, :portfolio_img)
    end

  def load_father
    @admin_enterprise = Admin::Enterprise.find(params[:enterprise_id])
  end
end