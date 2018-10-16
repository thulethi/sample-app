source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails',          '~> 5.2.1'
gem 'bootsnap',       '>= 1.1.0', require: false
gem 'bootstrap',      '~> 4.1.3'
gem 'cancancan',      '~> 2.0'
gem 'carrierwave',    '~> 1.0'
gem 'mini_magick'
gem 'fog'
gem 'faker'
gem 'sqlite3'
gem 'puma',           '~> 3.11'
gem 'sass-rails',     '~> 5.0'
gem 'uglifier',       '>= 1.3.0'
gem 'coffee-rails',   '~> 4.2'
gem 'turbolinks',     '~> 5'
gem 'jbuilder',       '~> 2.7'
gem 'jquery-rails'
gem 'bcrypt',         '~> 3.1.7'
gem 'rubocop',        '~> 0.58.2', require: false
gem 'will_paginate',  '~> 3.1.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry',          '~> 0.11.3'
  gem 'pry-rails',    '~> 0.3.6'
  gem 'rspec-rails',  '~> 3.8'
  gem 'guard-rspec'
  gem 'guard-bundler'
end

group :development do
  gem 'web-console',            '>= 3.3.0'
  gem 'listen',                 '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen',  '~> 2.0.0'
end

group :test do
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'rails-controller-testing'
  gem 'capybara',               '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'simplecov', require: false, group: :test
