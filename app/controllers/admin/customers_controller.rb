class Admin::CustomersController < ApplicationController
  layout "admin"
  before_action :set_admin_customer, only: [:show, :edit, :update, :destroy]
  access_control do
      allow :administrator, :all
  end
  # GET /admin/customers
  # GET /admin/customers.json
  def index
    @admin_customers = Admin::Customer.all
  end

  # GET /admin/customers/1
  # GET /admin/customers/1.json
  def show
  end

  # GET /admin/customers/new
  def new
    @admin_customer = Admin::Customer.new
  end

  # GET /admin/customers/1/edit
  def edit
  end

  # POST /admin/customers
  # POST /admin/customers.json
  def create
    @admin_customer = Admin::Customer.new(admin_customer_params)

    respond_to do |format|
      if @admin_customer.save
        format.html { redirect_to @admin_customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @admin_customer }
      else
        format.html { render :new }
        format.json { render json: @admin_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/customers/1
  # PATCH/PUT /admin/customers/1.json
  def update
    respond_to do |format|
      if @admin_customer.update(admin_customer_params)
        format.html { redirect_to @admin_customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_customer }
      else
        format.html { render :edit }
        format.json { render json: @admin_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/customers/1
  # DELETE /admin/customers/1.json
  def destroy
    @admin_customer.destroy
    respond_to do |format|
      format.html { redirect_to admin_customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_customer
      @admin_customer = Admin::Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_customer_params
      params.require(:admin_customer).permit(:title, :description, :published, :active, :ordem, :company_logo, :services_performed)
    end
end
