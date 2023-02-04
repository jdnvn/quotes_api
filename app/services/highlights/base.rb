module Highlights
  class Base < BaseService
    def set_book
      @book = Book.find_by(id: @attributes[:book_id])
    end
  end
end
