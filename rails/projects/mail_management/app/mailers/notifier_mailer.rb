class NotifierMailer < ApplicationMailer
    def welcome
        @user = params[:user]
        mail(to: @user.email, from: "sharmarick59@gmail.com", subject: "welcome to the team")
    end
end
