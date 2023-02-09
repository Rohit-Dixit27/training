class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  before_update :change_to_upcase
  after_update :after_the_update
  def change_to_upcase
    self.name.upcase!
  end
  def after_the_update
    self.name.chop!
  end
end
