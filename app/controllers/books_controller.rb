class BooksController < ApplicationController
  

  def index
    @book = Book.all
    @booknew = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end


  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy(book_params)
    redirect_to book_path(book.id)
  end

private
def book_params
  params.require(:book).permit(:title, :body)
end

end