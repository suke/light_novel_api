# frozen_string_literal: true

module Types
  module InputObject
    class TimeRange < Types::InputObject::BaseInputObject
      argument :from, Types::Scalar::DateTimeType, required: true
      argument :to, Types::Scalar::DateTimeType, required: true

      def range
        (@arguments['from']..@arguments['to'])
      end
    end
  end
end
