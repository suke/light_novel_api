# frozen_string_literal: true

module NovelSearchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings index: {
      number_of_shards: 1,
      number_of_replicas: 0,
      analysis: {
        filter: {
          pos_filter: {
            type: 'kuromoji_part_of_speech',
            stoptags: ['助詞-格助詞-一般', '助詞-終助詞']
          },
          greek_lowercase_filter: {
            type: 'lowercase',
            language: 'greek'
          }
        },
        analyzer: {
          kuromoji_analyzer: {
            type: 'custom',
            tokenizer: 'kuromoji_tokenizer',
            filter: %w[kuromoji_baseform pos_filter greek_lowercase_filter cjk_width]
          }
        }
      }
    }
  end
end
