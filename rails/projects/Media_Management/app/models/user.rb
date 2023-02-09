class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  before_create :ready_to_create
  around_create :around_the_create
  after_create :after_the_create
  def ready_to_create
    puts "ready to create"
  end
  def around_the_create
    puts "in"
    yield
    puts "out"
  end
  def after_the_create
    puts "after the create"
  end

end
