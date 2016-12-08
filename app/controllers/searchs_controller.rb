class SearchsController < ApplicationController
  def index
    @search_artigos = Article.where(['title LIKE ? OR subtitle LIKE ? or description LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%"])
    @search_empresas = Admin::Enterprise.joins(:specialities).where(['admin_enterprises.name LIKE ? OR admin_enterprises.description LIKE ? OR specialities.name LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%"])
    @treinamentos = Speciality.where(['name LIKE ?', "%#{params[:q]}%"])
  end
end
