class NotifierMailer < ApplicationMailer
    def send_data
        @user = params[:user]
         mail(to:"rohitdxt1999@gmail.com",from:"sharmarick59@gmail.com", subject:"this is data")    
    end
end
