class Book < ApplicationRecord
  has_many :highlights, foreign_key: 'book_id', inverse_of: :book, dependent: :destroy
end
