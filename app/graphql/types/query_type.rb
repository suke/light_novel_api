# frozen_string_literal: true

module Types
  class QueryType < Types::Object::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :novels, [Types::Object::NovelType], null: true do
      description 'Find a novels'
      argument :filter, Types::InputObject::NovelFilters, required: true
    end

    def novels(filter:)
      Novel.page(filter.page).per(filter.max_page_size)
    end

    field :novel, Types::Object::NovelType, null: true do
      description 'Find a novel by ID'
      argument :id, ID, required: true
    end

    def novel(id:)
      Novel.find(id)
    end

    field :author, Types::Object::AuthorType, null: true do
      description 'Find a novel by ID'
      argument :id, ID, required: true
    end

    def author(id:)
      Author.find(id)
    end

    field :illustrator, Types::Object::IllustratorType, null: true do
      description 'Find a novel by ID'
      argument :id, ID, required: true
    end

    def illustrator(id:)
      Illustrator.find(id)
    end

    field :publisher, Types::Object::PublisherType, null: true do
      description 'Find a novel by ID'
      argument :id, ID, required: true
    end

    def publisher(id:)
      Publisher.find(id)
    end
  end
end
