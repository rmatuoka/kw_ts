class EmpresasController < ApplicationController
  access_control do
    allow logged_in
  end
  
  def index
    @empresas = Admin::Enterprise.where(["name LIKE ? AND published = 1", "a%"]).order(:name => "ASC")
  end

  def show
    @empresa = Admin::Enterprise.find(params[:id])
    @portfolios = @empresa.portfolios.where(:published => true, :active => true)
    
    counter = 0
    @especialidades = "<div class='col-sm-4'>"
    @especialidades += "<ul>"
    
    @media = @empresa.enterprise_rates.all.average(:rate)
    
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
  
  def filters
    @empresas = Admin::Enterprise.where(["name LIKE ? AND published = 1", "#{params[:id]}%"]).order(:name => "ASC")
  end
end
