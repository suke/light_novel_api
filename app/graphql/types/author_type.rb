# frozen_string_literal: true

module Types
  class AuthorType < Types::BaseObject
    field :id, Integer, null: true
    field :name, String, null: true
  end
end
