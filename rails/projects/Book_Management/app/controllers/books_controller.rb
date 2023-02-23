class BooksController < ApplicationController
  layout 'books'
  
    def index
        @books=Book.all
    end

    def edit
        render :edit
    end
    
end
