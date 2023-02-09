class DestroyCallbackClass
    def after_destroy(post)
        post.destroy
        puts "destroyed"
    end
end