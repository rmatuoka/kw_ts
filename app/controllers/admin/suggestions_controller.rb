class Admin::SuggestionsController < ApplicationController
  access_control do
    allow :administrator, :all
  end 
  layout "admin"
  
  before_action :set_suggestion, only: [:show, :edit, :update, :destroy]

  # GET /admin/portfolios
  # GET /admin/portfolios.json
  def index
    @suggestions = Suggestion.all.order(:created_at => "DESC")
  end

  # DELETE /admin/portfolios/1
  # DELETE /admin/portfolios/1.json
  def destroy
    @suggestion.destroy
    respond_to do |format|
      format.html { redirect_to admin_suggestions_path, notice: 'Suggestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggestion
      @suggestion = Suggestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:suggestion).permit(:subject, :description, :user_id)
    end

end
