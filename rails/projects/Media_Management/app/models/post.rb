class Post < ApplicationRecord
    belongs_to :user, counter_cache: :count
    before_save :check_posts_count
    def check_posts_count
      throw(:abort) if user.count == 4
    end
end
