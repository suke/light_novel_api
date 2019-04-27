# frozen_string_literal: true

module Types
  class PublisherType < Types::BaseObject
    field :id, Integer, null: true
    field :name, String, null: true
  end
end
