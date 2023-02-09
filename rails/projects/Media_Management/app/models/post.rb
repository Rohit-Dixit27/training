class Post < ApplicationRecord
    belongs_to :user, counter_cache: :count
    after_destroy :destroy_message
    def destroy_message
        puts "post of user #{user.name} is deleted"
    end   
end
