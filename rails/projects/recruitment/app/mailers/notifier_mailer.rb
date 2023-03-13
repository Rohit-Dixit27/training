class NotifierMailer < ApplicationMailer
    def send_data
        @user = params[:user]
        attachments['git.pdf'] = File.read('app/assets/images/git.pdf')
         mail(to: @user.email, from: "sharmarick59@gmail.com", subject: "this is data")   
    end
end
