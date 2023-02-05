desc "Print reminder about eating more fruit."

namespace :db do
  task :seed do
    require 'json'

    f = File.read('db/highlights.json')
    json = JSON.parse(f)

    highlights = json['highlights']
    highlights.each do |highlight|
      book = Book.find_or_create_by(title: highlight['title'])
      text = highlight['highlight']
      page = highlight['page'].map(&:to_i).sort.first
      location = highlight['location'].map(&:to_i).sort.first
      highlighted_at = DateTime.strptime(highlight['date'], '%m/%d/%Y')
      book.highlights.find_or_create_by(
        text: highlight['highlight'],
        page: page,
        location: location,
        highlighted_at: highlighted_at
      )
    end
  end
end
