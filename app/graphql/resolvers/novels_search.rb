# frozen_string_literal: true

require 'search_object/plugin/graphql'

class Resolvers::NovelsSearch
  include SearchObject.module(:graphql)

  scope { Novel.all }

  type types[Types::NovelType]

  class NovelFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :title, String, required: false
  end

  option :filter, type: NovelFilter, with: :apply_filter

  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    scope = Novel.all
    scope = scope.where(title: value[:title]) if value[:title]

    branches << scope

    value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?

    branches
  end
end
