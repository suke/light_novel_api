# frozen_string_literal: true

class NovelsIndex < Chewy::Index
  define_type Novel.includes(
    :author, :illustrator, :publisher
  ) do
    field :title, type: :text
    field :isbn, type: :keyword
    field :release_date, type: :date
    field :author do
      field :name, type: :text, value: ->(author) { author.name }
    end
    field :illustrator do
      field :name, type: :text, value: ->(illustrator) { illustrator.name }
    end
    field :publisher do
      field :name, type: :text, value: ->(publisher) { publisher.name }
    end
  end

  def self.filter_by_query(queries = {})
    all.title_filter(queries[:title])
       .isbn_filter(queries[:isbn])
       .author_filter(queries[:author_name])
       .illustrator_filter(queries[:illustrator_name])
  end

  def self.title_filter(title = nil)
    return query {} if title.nil?

    query { match title: title }
  end

  def self.isbn_filter(isbn = nil)
    return query {} if isbn.nil?

    query do
      bool do
        filter do
          term isbn: isbn
        end
      end
    end
  end

  def self.author_filter(author_name)
    return query {} if author_name.nil?

    query { match 'author.name': author_name }
  end

  def self.illustrator_filter(illustrator_name)
    return query {} if illustrator_name.nil?

    query { match 'illustrator_name.name': illustrator_name }
  end

  def self.publisher_filter(publisher_name)
    return query {} if publisher_name.nil?

    query { match 'publisher_name.name': publisher_name }
  end
end
