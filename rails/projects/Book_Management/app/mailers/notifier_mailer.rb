class NotifierMailer < ApplicationMailer
    def alert_update
        mail(to:"rohitdxt1999@gmail.com", subject:"created")
    end
end
