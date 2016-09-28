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
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }      
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:password, :password_confirmation, :email, :name, :role, :last_name, :birthdate, :company, :services_performed, :cep, :street, :number, :neighborhood, :city, :state)
    end
end
