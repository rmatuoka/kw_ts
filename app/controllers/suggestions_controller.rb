class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: [:show, :edit, :update, :destroy]
  
  access_control do
    allow logged_in
  end
  
  def new
    @sugestion = Suggestion.new
  end
  
  def create
    @sugestion = Suggestion.new(suggestion_params)
    
    respond_to do |format|
      if @sugestion.save
        
        #Notifier.send_sugestion(@sugestion).deliver
        
        format.html { redirect_to @sugestion, notice: 'Sugestion was successfully created.' }
        format.json { render :show, status: :created, location: @sugestion }
      else
        format.html { render :new }
        format.json { render json: @sugestion.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggestion
      @sugestion = Suggestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suggestion_params
      params.require(:suggestion).permit(:subject, :description, :user_id)
    end
end
