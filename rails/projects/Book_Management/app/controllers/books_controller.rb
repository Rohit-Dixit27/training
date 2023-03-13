require "prawn"
class BooksController < ApplicationController
  layout 'main', except: [:show, :edit]
  before_action :find_book, only: [:edit, :update, :show, :destroy]
  #http_basic_authenticate_with name: "abc", password: "1234"
  #USERS = { "abc" => "world" }
  #before_action :authenticate


    def index
        @books=Book.all
        respond_to do |format|
          format.html
          format.pdf do
            pdf = Prawn::Document.new
            pdf.text "hello"
            send_data pdf.render, filename:'books.pdf', type: 'application/pdf', disposition: "inline"
          end
        end
    end
    def show
      @book = Book.find(params[:id])
      #abc = params[:abc]
    end  
   
    def new
      @book = Book.new
    end
    def display
      render :display
    end
    def search
      render :search
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
     # @book = Book.find(params[:id])
    end
    #def upload
     # uploaded_file = params[:picture]
     # File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
     # file.write(uploaded_file.read)
    #end
    #end
    def update
      #@book = Book.find(params[:id])
      if @book.update(book_params)
        NotifierMailer.alert_update.deliver
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
    private
    def find_book
      @book = Book.find(params[:id])
    end

  #private
  #def authenticate
    #authenticate_or_request_with_http_digest do |username|
    #  USERS[username]
   # end
  #end
end