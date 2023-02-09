class Post < ApplicationRecord
    belongs_to :user, counter_cache: :count
end
