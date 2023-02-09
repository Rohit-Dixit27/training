class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  before_destroy :before_the_destroy
  around_destroy :around_the_destroy
  after_destroy :after_the_destroy
  def before_the_destroy
    puts "ready to delete"
  end
  def around_the_destroy
    puts "in destroy"
    yield
    puts "out destroy"
  end
  def after_the_destroy
    puts "deleted"
  end
end
