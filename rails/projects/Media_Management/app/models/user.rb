class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  after_touch :touch_message
  def touch_message
    puts "touched an object"
  end
end
