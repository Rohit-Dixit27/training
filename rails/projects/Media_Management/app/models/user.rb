class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, length: { maximum: 6 }
  before_validation :remove_whitespaces
  after_validation :Display

  def remove_whitespaces
    self.name.strip!
  end

  def Display
    puts "validation is done "
  end
  
end
