class Admin::OrganizationImagesController < ApplicationController
   access_control do
    allow :administrator, :all
  end
  layout "admin"

  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_filter :load_father
  
  # GET /organization_images
  # GET /organization_images.json
  def index
    @organization_images = @organization.organization_images.all
  end

  # GET /organization_images/1
  # GET /organization_images/1.json
  def show

  end

  # GET /organization_images/new
  def new
    @organization_images = @organization.organization_images.build
  end

  # GET /organization_images/1/edit
  def edit

  end

  # POST /organization_images
  # POST /organization_images.json
  def create
    @organization_images = @organization.organization_images.build(image_params)
    @organization_images.organization_id = @organization.id
    @organization_images.save
    respond_to do |format|
      if @organization_images.save

        format.html { redirect_to admin_organization_organization_image_path(@organization, @organization_images), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: admin_organization_article_path(@organization, @organization_images) }
      else
        format.html { render :new }
        format.json { render json: @organization_images.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization_images/1
  # PATCH/PUT /organization_images/1.json
  def update
    respond_to do |format|
      if @organization_images.update(image_params)
        
        format.html { redirect_to admin_organization_organization_image_path(@organization, @organization_images), notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @organization_images] }
      else
        format.html { render :edit }
        format.json { render json: @organization_images.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /organization_images/1
  # DELETE /organization_images/1.json
  def destroy
    
    @organization_images.destroy
    respond_to do |format|
      format.html { redirect_to admin_organization_organization_images_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @organization_images = OrganizationImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:organization_image).permit(:title, :image)
    end


    def load_father
      @organization = Admin::Organization.find(params[:organization_id])
    end
end
