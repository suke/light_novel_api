# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.6.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'active_model_serializers'
gem 'grape'
gem 'grape-active_model_serializers'
gem 'rails', '~> 5.2.1'

# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'config'
gem 'dotenv-rails'
gem 'puma', '~> 4.3'

gem 'carrierwave'
gem 'graphiql-rails'
gem 'graphql'
gem 'graphql-batch'

gem 'search_object', '1.2.2'
gem 'search_object_graphql', '0.2'

gem 'kaminari'

gem 'chewy'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'bootsnap', '>= 1.1.0', require: false
gem 'jbuilder', '~> 2.9'
gem 'nokogiri'
gem 'rack-cors', require: 'rack/cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 5.0'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'annotate'
  gem 'bullet'
  gem 'foreman'
  gem 'rb-readline'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'graphiql-rails', group: :development
