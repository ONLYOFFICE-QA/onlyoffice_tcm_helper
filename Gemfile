# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gemspec

group :test do
  gem 'rspec', '~> 3'
  gem 'simplecov', '~> 0', require: false
end

group :development do
  gem 'overcommit', '~> 0', require: false
  gem 'rake', '~> 13'
  gem 'rubocop', '~> 1'
  gem 'rubocop-performance', '~> 1'
  gem 'rubocop-rake', '~> 0'
  gem 'rubocop-rspec', '~> 2'
  gem 'yard', '>= 0.9.20', require: false
end
