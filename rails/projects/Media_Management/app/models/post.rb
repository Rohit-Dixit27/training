class Post < ApplicationRecord
    belongs_to :user, counter_cache: :count
    after_destroy DestroyCallbackClass.new 
end
