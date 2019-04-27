# frozen_string_literal: true

module Types
  class NovelType < Types::BaseObject
    field :id, Integer, null: true
    field :title, String, null: true
    field :book_size, String, null: true
    field :isbn, String, null: true
    field :price, Integer, null: true
    field :release_date, Types::DateTimeType, null: true
  end
end
