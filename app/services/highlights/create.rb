module Highlights
  class Create < Base
    def initialize(attributes:)
      @attributes = attributes
    end

    def call
      ActiveRecord::Base.transaction do
        create_highlight
      end

      success(@highlight)
    rescue StandardError => e
      Rails.logger.error(e)
      failure('highlight could not be created')
    end

    private

    def create_highlight
      @highlight =
        Highlight.create(
          text: @attributes['text'],
          page: @attributes['page'],
          location: @attributes['location'],
          book_id: @attributes['book_id'],
          highlighted_at: formatted_highlighted_at
        )
      raise 'Could not create highlight' if !@highlight
    end

    def formatted_highlighted_at
      @attributes['highlighted_at']
    end
  end
end
