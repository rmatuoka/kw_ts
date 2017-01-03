class ColunasController < ApplicationController
  before_action :set_admin_columnist, only: [:show, :edit, :update, :destroy]

  # GET /admin/columnists
  # GET /admin/columnists.json
  def index
    @admin_columnists = current_user.columnists.where(["active = 1 AND published = 1"])
  end

end
