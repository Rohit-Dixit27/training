class BooksController < ApplicationController
  layout 'main', except: [:show, :edit]
    def index
        @books=Book.all
    end
    def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to(@book)
      else
        render "edit"
      end
    end
    def edit
      @book = Book.find(params[:id])
    end
    
    def show
      @book = Book.find(params[:id])
    end  

end
