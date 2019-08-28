# frozen_string_literal: true

require 'search_object/plugin/graphql'

class Resolvers::AuthorsSearch
  include SearchObject.module(:graphql)

  scope { Author.all }

  type types[Types::Object::NovelsConnection]

  option :filter, type: Types::InputObject::AuthorFilter, with: :apply_filter

  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    scope = Author.all
    scope = apply_name_filter(value[:name], scope) if value[:name]

    branches << scope

    value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?

    branches
  end

  def apply_name_filter(val, scope)
    scope.where(name: val)
  end
end
