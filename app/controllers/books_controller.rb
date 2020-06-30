class BooksController < ApplicationController


  def index
    @book = Book.all
    @booknew = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end


  def create
    @booknew = Book.new(book_params)
    if @booknew.save
      redirect_to book_path(@booknew.id)
      flash[:notice] = "Book was successfully created."
    else
      @book = Book.all
      render "index"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully updated."
    else
      render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path(book.id)
    end
  end

private
def book_params
  params.require(:book).permit(:title, :body)
end

end
