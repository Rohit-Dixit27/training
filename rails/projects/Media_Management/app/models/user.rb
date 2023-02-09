class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  after_find :display
  def display
    puts "found"
  end
end
