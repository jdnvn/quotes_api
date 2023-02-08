module Books
  class Create < Base
    attr_reader :attributes

    def initialize(attributes:)
      @attributes = attributes
    end

    def call
      ActiveRecord::Base.transaction do
        create_book!
      end

      success(@book)
    rescue StandardError => e
      Rails.logger.error(e)
      failure('could not be create that book')
    end

    private

    def create_book!
      @book = Book.create!(title: attributes['title'], author: attributes['author'])
      raise StandardError unless @book
    end

    # TODO: hit book api to get book cover art/other info
  end
end
