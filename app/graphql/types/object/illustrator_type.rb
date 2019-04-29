# frozen_string_literal: true

module Types
  module Object
    class IllustratorType < Types::Object::BaseObject
      field :id, Integer, null: true
      field :name, String, null: true
    end
  end
end
