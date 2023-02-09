class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, length: { maximum: 6 }
  before_validation :remove_whitespaces
  after_validation :Display
  before_save :change_to_downcase
  around_save :show_around_save
  after_save :after_save

  def remove_whitespaces
    self.name.strip!
  end
  def Display
    puts "validation is done "
  end
  def change_to_downcase
    self.name.downcase!
  end
  def show_around_save
    puts "in save"
    yield
    puts "out save"
  end
  def after_save
    puts "user is saved"
  end
end
