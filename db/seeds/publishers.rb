# frozen_string_literal: true

require 'csv'

CSV.foreach('db/csv/publishers.csv', headers: true) do |row|
  Publisher.find_or_create_by(name: row['name'])
end
