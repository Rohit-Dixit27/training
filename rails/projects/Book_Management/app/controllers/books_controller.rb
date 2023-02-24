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
    def new
        @book = Book.new
        2.times { @book.orders.build }
    end
    def create
      @book = Book.new(book_params)
    end
    private
      def book_params
        params.require(:book).permit(:name, orders_attributes: [:card_number, :payment_type])
      end
   
    def edit
      @book = Book.find(params[:id])
    end
    
    def show
      @book = Book.find(params[:id])
    end  
    private
    def book_params
      params.require(:book).permit(:name, :price)
    end

end
