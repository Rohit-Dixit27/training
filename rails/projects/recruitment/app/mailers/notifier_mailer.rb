class NotifierMailer < ApplicationMailer
    def send_notification
        @user = params[:user]
         mail(to:"rohitdxt1999@gmail.com", from:"sharmarick59@gmail.com", subject:"this is data",
        template_path: "notification", template_name: "notification")    
    end
end
