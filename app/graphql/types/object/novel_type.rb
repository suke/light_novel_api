# frozen_string_literal: true

module Types
  module Object
    class NovelType < Types::Object::BaseObject
      field :id, Integer, null: true
      field :title, String, null: true
      field :book_size, String, null: true
      field :isbn, String, null: true
      field :price, Integer, null: true
      field :release_date, Types::Scalar::DateTimeType, null: true
      field :author, Types::Object::AuthorType, null: true
      field :illustrator, Types::Object::IllustratorType, null: true
      field :publisher, Types::Object::PublisherType, null: true
      field :image_url, String, null: true

      def image_url
        object.image.url
      end

      def author
        Loaders::AssociationLoader.for(Novel, :author).load(object)
        # Loaders::RecordLoader.for(Publisher).load(object.publisher_id)
      end

      def publisher
        Loaders::AssociationLoader.for(Novel, :publisher).load(object)
        # Loaders::RecordLoader.for(Publisher).load(object.publisher_id)
      end

      def illustrator
        Loaders::AssociationLoader.for(Novel, :illustrator).load(object)
        # Loaders::RecordLoader.for(Illustrator).load(object.illustrator_id)
      end
    end
  end
end
