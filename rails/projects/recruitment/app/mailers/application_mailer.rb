class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "notification_layout"
end
