# frozen_string_literal: true

require 'csv'

CSV.foreach('db/csv/illustrators.csv', headers: true) do |row|
  Illustrator.find_or_create_by(name: row['name'])
end
