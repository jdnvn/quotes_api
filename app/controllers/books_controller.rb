class BooksController < ApplicationController
  def index
    # TODO: filter books
    books = Book.order('books.created_at DESC')
    render json: books, status: :ok
  end

  def show
    book = Book.find_by(id: params[:id])

    if book
      render json: book, status: :ok
    else
      render json: { error: "A book with that id was not found" }, status: :not_found
    end
  end

  def update
    book = Book.find_by(id: params[:id])
    return render json: "No book with that id", status: :not_found unless book

    result = Books::Update.new(book: book, attributes: params).call

    if result.success?
      render json: result.value, status: :ok
    else
      render json: result.error, status: :unprocessable_entity
    end
  end

  def destroy
    Book.find_by(id: params[:id]).destroy!

    render status: :no_content
  end

  def create
    result = Books::Create.new(attributes: params).call

    if result.success?
      render json: result.value, status: :created
    else
      render json: { error: result.error }, status: :unprocessable_entity
    end
  end
end
