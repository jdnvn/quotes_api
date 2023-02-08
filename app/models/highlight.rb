class Highlight < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :book, foreign_key: 'book_id', inverse_of: :highlights, optional: true
end
