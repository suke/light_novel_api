# frozen_string_literal: true

require 'csv'

CSV.foreach('db/csv/novels.csv', headers: true) do |row|
  author = Author.find_or_create_by(name: row['author'])
  illustrator = Illustrator.find_or_create_by(name: row['illustrator'])
  publisher = Publisher.find_or_create_by(name: row['publisher'])

  novel = Novel.find_or_create_by(
    title: row['title'],
    book_size: row['book_size'],
    isbn: row['isbn'],
    price: row['price'],
    release_date: row['release_date'],
    author: author,
    illustrator: illustrator,
    publisher: publisher
  )
  # novel.update!(image: File.open(Rails.root.join("public/image/#{row['isbn']}.jpg")))
end
