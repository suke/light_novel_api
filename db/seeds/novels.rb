# frozen_string_literal: true

require 'csv'

CSV.foreach('db/csv/novels.csv', headers: true) do |row|
  Novel.find_or_create_by(
    title: row['title'],
    book_size: row['book_size'],
    isbn: row['isbn'],
    price: row['price'],
    release_date: row['release_date'],
    author_id: row['author_id'],
    illustrator_id: row['illustrator_id'],
    publisher_id: row['publisher_id']
  )
end
