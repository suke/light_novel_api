# frozen_string_literal: true

class NovelsIndex < Chewy::Index
  define_type Novel.includes(
    :author, :illustrator, :publisher
  ) do
    field :title, type: :text
    field :isbn, type: :text
    field :release_date, type: :date
    field :author do
      field :name, type: :text, value: ->(author) { author.name }
    end
    field :author do
      field :name, type: :text, value: ->(illustrator) { illustrator.name }
    end
    field :publisher do
      field :name, type: :text, value: ->(publisher) { publisher.name }
    end
  end
end
