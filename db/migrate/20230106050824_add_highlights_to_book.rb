class AddHighlightsToBook < ActiveRecord::Migration[7.0]
  def change
    add_reference :highlights, :book, foreign_key: true, type: :uuid
  end
end
