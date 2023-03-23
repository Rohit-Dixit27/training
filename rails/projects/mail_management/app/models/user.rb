class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true
  after_create :send_email
  ALLOWED_EXTENSIONS = ['.xls', '.xlsx']
  
  def send_email
    SendJob.perform_async(id)
  end
end
