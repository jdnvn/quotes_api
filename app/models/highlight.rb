class Highlight < ApplicationRecord
  belongs_to :book, foreign_key: 'book_id', inverse_of: :highlights, optional: true
end
