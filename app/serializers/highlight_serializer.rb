class HighlightSerializer < ActiveModel::Serializer
  attributes :id, :text, :page, :location, :highlighted_at

  has_one :book
end
