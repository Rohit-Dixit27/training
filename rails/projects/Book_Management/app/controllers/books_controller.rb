class BooksController < ApplicationController
  layout 'main', except: :show


    def index
        @books=Book.all
    end
    def edit
        render :edit
    end
    
    def show
      render :show
    end
    
end
