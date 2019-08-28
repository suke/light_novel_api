# frozen_string_literal: true

module Types
  module Object
    class AuthorEdgeType < GraphQL::Types::Relay::BaseEdge
      node_type(Types::Object::AuthorType)
    end

    class AuthorsConnection < GraphQL::Types::Relay::BaseConnection
      field :total_count, Integer, null: false
      def total_count
        object.nodes.size
      end
      edge_type(AuthorEdgeType)
    end
  end
end
