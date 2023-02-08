module Highlights
  class Update < Base
    attr_reader :highlight, :attributes

    def initialize(highlight:, attributes:)
      @highlight = highlight
      @attributes = attributes
    end

    def call
      update_highlight
      success(highlight)
    rescue StandardError => e
      Rails.logger.error(e)
      failure(error: e)
    end

    private

    def update_highlight
      highlight.update(
        text: attributes[:text],
        page: attributes[:page],
        location: attributes[:location],
        book_id: attributes[:book_id]
      )
    end
  end
end
