# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bulma-rails', '~> 0.7.5'
gem 'bulma-extensions-rails'
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-sass', '~> 5.8.1'
gem 'haml', '~> 5.1', '>= 5.1.1'
gem 'hirb'
gem 'jbuilder', '~> 2.5'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'
gem 'rspec', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'sqlite3'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'pg'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]