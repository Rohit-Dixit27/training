class NotifierMailer < ApplicationMailer
    def send_data
        @user = params[:user]
        attachments['id.jpg'] = File.read('app/assets/images/id.jpg')
         mail(to: @user.email, from: "sharmarick59@gmail.com", subject: "this is data",)   
    end
end
