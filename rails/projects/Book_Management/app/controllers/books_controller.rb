class BooksController < ApplicationController
  layout 'main', except: [:show, :edit]
    def index
        @books=Book.all
    end
    def edit   
    end
    def show
      @book = Book.find(params[:id])
    end    
end
