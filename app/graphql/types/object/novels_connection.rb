# frozen_string_literal: true

module Types
  module Object
    class NovelEdgeType < GraphQL::Types::Relay::BaseEdge
      node_type(Types::Object::NovelType)
    end

    class NovelsConnection < GraphQL::Types::Relay::BaseConnection
      field :total_count, Integer, null: false
      def total_count
        object.nodes.size
      end
      edge_type(NovelEdgeType)
    end
  end
end
