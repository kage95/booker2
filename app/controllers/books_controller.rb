class BooksController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(current_user.id)
  end
  
  private
  
  def book_params
    params.permit(:title,:body)
  end
  
end
