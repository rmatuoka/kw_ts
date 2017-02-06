class UsersController < ApplicationController

  
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.role = "user"
    if @user.save        
      redirect_to perfil_path, notice_user: 'User was successfully created.'      
    else
      redirect_to register_path
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_user_path(@user), notice_user: 'Seu perfil foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: [:admin, @user.errors], status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:password, :password_confirmation, :email, :name, :role, :last_name, :birthdate, :company, :services_performed, :cep, :street, :number, :neighborhood, :city, :state, :picture, :cover)
    end
end
