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
    #def new
     #   @book = Book.new
     #   2.times { @book.orders.build }
    #end
    #def create
     # @book = Book.new(book_params)
    #end
    #private
    def book_params
      params.require(:book).permit(:name, orders_attributes: [:card_number, :payment_type, :_destroy])
    end
   
    def edit
      @book = Book.find(params[:id])
    end
    def upload
      uploaded_file = params[:picture]
      File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
      file.write(uploaded_file.read)
    end
    end

    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to root_path, status: :see_other
    end
    
    def show
      @book = Book.find(params[:id])
    end  
    private
    def book_params
      params.require(:book).permit(:name, :price)
    end

end
