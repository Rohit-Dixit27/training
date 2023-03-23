class SendJob
  include Sidekiq::Worker
  sidekiq_options retry: false
  def perform(*args, user_id)
    NotifierMailer.with(user: User.find_by_id(user_id)).welcome.deliver_now
  end
end
  