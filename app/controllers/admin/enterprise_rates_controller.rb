class Admin::EnterpriseRatesController < ApplicationController

  layout "admin"
  before_action :set_admin_rate, only: [:show, :edit, :update, :destroy]
  access_control do
      allow :administrator, :all
  end
  # GET /admin/highlights
  # GET /admin/highlights.json
  def index
    @admin_rates = EnterpriseRate.all.order(:id => "desc")
  end

  # GET /admin/highlights/1/edit
  def edit
  end

  # PATCH/PUT /admin/highlights/1
  # PATCH/PUT /admin/highlights/1.json
  def update
    respond_to do |format|
      if @admin_rate.update(admin_rate_params)
        format.html { redirect_to admin_enterprise_rates_path, notice: 'Highlight was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_rate }
      else
        format.html { render :edit }
        format.json { render json: @admin_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/highlights/1
  # DELETE /admin/highlights/1.json
  def destroy
    @admin_rate.destroy
    respond_to do |format|
      format.html { redirect_to admin_enterprise_rates_path, notice: 'Highlight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_rate
      @admin_rate = EnterpriseRate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_rate_params
      params.require(:enterprise_rate).permit(:enterprise_id, :rate, :user_id, :agreement, :comment)
    end

end
