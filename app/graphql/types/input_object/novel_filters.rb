# frozen_string_literal: true

module Types
  module InputObject
    class NovelFilters < Types::InputObject::BaseInputObject
      argument :page, Integer, required: true
      argument :max_page_size, Integer, required: false, default_value: 10
    end
  end
end
