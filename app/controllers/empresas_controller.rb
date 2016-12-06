class EmpresasController < ApplicationController

  def index
    @empresas = Admin::Enterprise.all
  end

  def show
    @empresa = Admin::Enterprise.find(params[:id])
    @portfolios = @empresa.portfolios.where(:published => true, :active => true)
    
    counter = 0
    @especialidades = "<div class='col-sm-4'>"
    @especialidades += "<ul>"
    
    @empresa.specialities.all.each do |s|
      
      if counter < 3
        @especialidades += "<li>#{s.name}</li>"
      else
        @especialidades += "</ul>"
        @especialidades += "</div>"
        @especialidades += "<div class='col-sm-4'>"
        @especialidades += "<ul>"
      end
      
      counter = counter + 1
    end
    
    @especialidades += "</ul>";
    @especialidades += "</div>";
    
  end
  
  def tags
    @speciality = Speciality.find(params[:id])
    @empresas = @speciality.enterprises.all 
  end
end
