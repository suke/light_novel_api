module Mutations
  class CreateNovel < GraphQL::Schema::Mutation
    argument :title, String, required: true
    argument :book_size, String, required: false
    argument :isbn, String, required: true
    argument :price, Integer, required: false
    argument :release_date, Types::Scalar::DateTimeType, required: false
    argument :author_id, Integer, required: true
    argument :illustrator_id, Integer, required: true
    argument :publisher_id, Integer, required: true
    argument :image_url, String, required: false

    type Types::Object::NovelType

    def resolve(*params)
      Novel.create!(params)
    rescue ActiveRecord::RecordInvalid => e
      raise GraphQL::ExecutionError.new(
        'invalid parameter',
        extensions: { additional_messages: e.record.errors.full_messages }
      )
    end
  end
end
