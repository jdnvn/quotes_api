module Books
  class Update < Base
    attr_reader :book, :attributes

    def initialize(book:, attributes:)
      @book = book
      @attributes = attributes
    end

    def call
      update_book
      success(book)
    rescue StandardError => e
      Rails.logger.error(e)
      failure(error: e)
    end

    private

    def update_book
      book.update(
        title: attributes[:title],
        author: attributes[:author]
      )
    end
  end
end
