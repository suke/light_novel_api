# frozen_string_literal: true

require 'csv'

CSV.foreach('db/csv/authors.csv', headers: true) do |row|
  Author.find_or_create_by(name: row['name'])
end
