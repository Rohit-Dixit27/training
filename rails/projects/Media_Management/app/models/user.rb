class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  after_commit :at_last
  def at_last
    puts "all committed sucesfully"
  end
end
