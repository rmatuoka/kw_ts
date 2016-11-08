class Notifier < ApplicationMailer
  def send_sugestion(sugestion)
    @sugestion = sugestion
    
    user = User.find(@sugestion.user_id)
    mail(:to => "administrador@temp.com.br", :bcc => "log@korewa.com.br", :subject => "Nova sugestão enviada por #{user.name} #{user.last_name} ")   
    
  end
end
