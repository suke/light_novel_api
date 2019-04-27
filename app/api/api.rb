# frozen_string_literal: true

module API
  class Root < Grape::API
    content_type :json, 'application/json;charset=UTF-8'
    default_format :json

    mount API::V1::Root
  end
end
