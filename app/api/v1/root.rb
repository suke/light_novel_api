# frozen_string_literal: true

module V1
  class Root < Grape::API
    version 'v1'
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers
  end
end
