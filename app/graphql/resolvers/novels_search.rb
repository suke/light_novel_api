# frozen_string_literal: true

require 'search_object/plugin/graphql'

class Resolvers::NovelsSearch
  include SearchObject.module(:graphql)

  scope { Novel.all }

  type types[Types::Object::NovelsConnection]

  option :filter, type: Types::InputObject::NovelFilter, with: :apply_filter

  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    scope = Novel.all
    scope = apply_title_filter(value[:title], scope) if value[:title]
    scope = apply_isbn_filter(value[:isbn], scope) if value[:isbn]
    scope = apply_illustrator_filter(value[:illustrator_id], scope) if value[:illustrator_id]
    scope = apply_publisher_filter(value[:publisher_id], scope) if value[:publisher_id]
    scope = apply_release_date_filter(value[:release_date], scope) if value[:release_date]

    branches << scope

    value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?

    branches
  end

  def apply_title_filter(val, scope)
    scope.where(title: val)
  end

  def apply_isbn_filter(val, scope)
    scope.where(isbn: val)
  end

  def apply_illustrator_filter(val, scope)
    scope.where(illustrator_id: val)
  end

  def apply_publisher_filter(val, scope)
    scope.where(publisher_id: val)
  end

  def apply_release_date_filter(val, scope)
    scope.where(release_date: val)
  end
end
