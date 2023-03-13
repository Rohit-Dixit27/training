class NotifierMailerPreview < ActionMailer::Preview
    def send_notification
        NotifierMailer.with(user: User.first).send_notification
    end
end