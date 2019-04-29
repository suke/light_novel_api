# frozen_string_literal: true

module Types
  module Object
    class NovelType < Types::Object::BaseObject
      field :id, Integer, null: true
      field :title, String, null: true
      field :book_size, String, null: true
      field :isbn, String, null: true
      field :price, Integer, null: true
      field :release_date, Types::Scalar::DateTimeType, null: true
      field :author, Types::Object::AuthorType, null: true
      field :illustrator, Types::Object::IllustratorType, null: true
      field :publisher, Types::Object::PublisherType, null: true
    end
  end
end
