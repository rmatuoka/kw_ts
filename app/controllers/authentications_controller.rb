class AuthenticationsController < ApplicationController
  def create
    require 'securerandom'
    
    omniauth = request.env['omniauth.auth']
    puts "OMNI AUTH #{omniauth}"
    authentication = Authentication.find_by_provider_and_uid(omniauth.provider, omniauth.uid)
 
    if authentication
      puts "===================================="
      puts "          Logar usuário"
      puts "===================================="      
      # User is already registered with application
      flash[:info] = 'Signed in successfully.'
      sign_in_and_redirect(authentication.user)
    elsif current_user
      puts "===================================="
      puts "          Vincula usuário"
      puts "===================================="      
      # User is signed in but has not already authenticated with this social network
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      #current_user.apply_omniauth(omniauth)
      current_user.save
 
      flash[:info] = 'Authentication successful.'
      redirect_to perfil_path
    else
      # User is new to this application
      puts "===================================="
      puts "          Cadastra usuário"
      puts "===================================="           
      user = User.new
      user.role = "user"
      user.apply_omniauth(omniauth)
      password = SecureRandom.base64(6) 
      puts "===================================="
      puts "          Senha usuário "+ password
      puts "===================================="      
      user.password = password
      user.password_confirmation = password     
      if user.save
        user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
        #user.authentications.build(:provider => omniauth.provider, :uid => omniauth.uid)
        
        #UserMailer.send_email_password_fb(user).deliver
        #ENVIAR EMAIL
        flash[:info] = 'User created and signed in successfully.'
        sign_in_and_redirect(user)
        #redirect_to perfil_path, :notice => "Usuário Cadastrado com Sucesso!"
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to login_path
      end
    end
  end
 
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = 'Successfully destroyed authentication.'
    redirect_to authentications_url
  end
 
  private
  def sign_in_and_redirect(user)
    unless current_user
      user_session = UserSession.new(User.find_by_single_access_token(user.single_access_token))
      user_session.save
    end
    redirect_to perfil_path
  end
end