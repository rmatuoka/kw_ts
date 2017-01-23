class RatesController < ApplicationController
  layout  "blank"
  before_filter :load_empresa
   
  def new
    @enterprise_rate = @empresa.enterprise_rates.build
  end
  
  def create
    @enterprise_rate = @empresa.enterprise_rates.build(enterprise_rates_params)
    @enterprise_rate.user_id = current_user.id
    
    if @enterprise_rate.save
      redirect_to empresa_rate_path(@empresa, @enterprise_rate)
    else
      render :action => :new
    end
  end
  
  def show
    
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def enterprise_rates_params
      params.require(:enterprise_rate).permit(:rate, :user_id, :comment, :agreement)
    end
    
  def load_empresa
    @empresa = Admin::Enterprise.find(params[:empresa_id])
  end
end
