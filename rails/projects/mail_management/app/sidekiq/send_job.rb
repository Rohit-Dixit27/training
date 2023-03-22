class SendJob
  include Sidekiq::Job

  def perform(*args)
    User.find_each do |user|
      NotifierMailer.with(user: user).welcome.deliver_later
    end
  end
end
