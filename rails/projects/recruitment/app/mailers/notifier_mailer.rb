class NotifierMailer < ApplicationMailer
    def send_notification
        @user = params[:user]
         mail(to: email_address_with_name(@user.email, @user.name), from:"sharmarick59@gmail.com", subject:"this is data",
        template_path: "notification", template_name: "notification")    
    end
end
