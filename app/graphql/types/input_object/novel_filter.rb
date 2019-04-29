# frozen_string_literal: true

module Types
  module InputObject
    class NovelFilter < Types::InputObject::BaseInputObject
      argument :OR, [self], required: false
      argument :page, Integer, required: false, default_value: 1
      argument :max_page_size, Integer, required: false, default_value: 10
      argument :title, String, required: false
      argument :isbn, String, required: false
      argument :illustrator_id, Integer, required: false
      argument :publisher_id, Integer, required: false
      argument :release_date, Types::InputObject::TimeRange, required: false, prepare: lambda { |arg, _ctx|
        arg.range
      }
    end
  end
end
