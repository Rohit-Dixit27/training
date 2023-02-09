class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  before_save :message, if: :check_before_save
  def check_before_save
    puts "ready to save"  
  end
end
