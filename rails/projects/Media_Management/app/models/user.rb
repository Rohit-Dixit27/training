class User < ApplicationRecord
  has_many :posts, after_remove: :check, dependent: :destroy
  def check(post)
    puts " completely deleted post with id:! #{ post.id }"
    end
end
