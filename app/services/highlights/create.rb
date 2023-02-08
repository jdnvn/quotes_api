module Highlights
  class Create < Base
    attr_reader :attributes

    def initialize(attributes:)
      @attributes = attributes
    end

    def call
      ActiveRecord::Base.transaction do
        create_highlight!
      end

      success(@highlight)
    rescue StandardError => e
      Rails.logger.error(e)
      failure('could not create that highlight')
    end

    private

    def create_highlight!
      @highlight =
        Highlight.create!(
          text: attributes['text'],
          page: attributes['page'],
          location: attributes['location'],
          book_id: attributes['book_id'],
          highlighted_at: formatted_highlighted_at
        )
      raise StandardError unless @highlight
    end

    def formatted_highlighted_at
      attributes['highlighted_at']
    end
  end
end
