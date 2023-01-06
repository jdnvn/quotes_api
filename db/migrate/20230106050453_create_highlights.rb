class CreateHighlights < ActiveRecord::Migration[7.0]
  def change
    create_table :highlights, id: :uuid do |t|
      t.text :text
      t.datetime :highlighted_at
      t.integer :page
      t.integer :location

      t.timestamps
    end
  end
end
