# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :novel, NovelType, null: true do
      description 'Find a novel by ID'
      argument :id, ID, required: true
    end

    def novel(id:)
      Novel.find(id)
    end
  end
end
