# frozen_string_literal: true

module Types
  class QueryType < Types::Object::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :novels, [Types::Object::NovelType], function: Resolvers::NovelsSearch, null: true do
      description 'Find a novels'
    end

    field :novel, Types::Object::NovelType, null: true do
      description 'Find a novel by ID'
      argument :id, ID, required: true
    end

    def novel(id:)
      Novel.find(id)
    end

    field :this_month_new_novels, [Types::Object::NovelType], null: true do
      description 'Find a novel by ID'
    end

    def this_month_new_novels
      Novel.where(release_date: Time.now.all_month)
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
