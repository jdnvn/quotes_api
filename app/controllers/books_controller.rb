class BooksController < ApplicationController
  def index
    # TODO: filter books
    render json: Books.all, status: :ok
  end

  def show
    book = Book.find_by(id: params[:id])

    if book
      render json: book, status: :ok
    else
      render json: { error: "A book with that id was not found" }, status: :not_found
    end
  end
end
