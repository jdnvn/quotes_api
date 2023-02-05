class AddSentToHighlights < ActiveRecord::Migration[7.0]
  def change
    add_column :highlights, :sent, :boolean, default: false
  end
end
