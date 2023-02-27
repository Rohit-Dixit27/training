class BooksController < ApplicationController
  layout 'main', except: [:show, :edit]
    def index
        @books=Book.all
    end
    def show
      @book = Book.find(params[:id])
    end  
   
    def new
      @book = Book.new
    end

    def create
      @book = Book.new(book_params)
      if @book.save
        redirect_to @book
      else
      render :new, status: :unprocessable_entity
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
   # def book_params
    #  params.require(:book).permit(:name, orders_attributes: [:card_number, :payment_type, :_destroy])
    # end
   
    def edit
      @book = Book.find(params[:id])
    end
    #def upload
     # uploaded_file = params[:picture]
     # File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
     # file.write(uploaded_file.read)
    #end
    #end
    def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice] = "updated successfully"
        redirect_to(@book)
      else
        render "edit"
      end
    end

    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to root_path, status: :see_other
    end 
    private
    def book_params
      params.require(:book).permit(:name, :price)
    end
end