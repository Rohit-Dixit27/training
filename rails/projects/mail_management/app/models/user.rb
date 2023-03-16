class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true
  after_create :send_email

  def send_email
    NotifierMailer.with(user: self).delay.welcome
  end
end
