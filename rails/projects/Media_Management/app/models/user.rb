class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  after_find :search
  def search
    puts "found"
  end
  after_initialize :show_initialized
  def show_initialized
    puts "object is initialized sucesfully"
  end
end
