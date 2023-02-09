class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  after_update :update_message
  after_destroy :destroy_message
  def update_message
    puts "updation done"
  end
  def destroy_message
    puts "destroyed"
  end
end
