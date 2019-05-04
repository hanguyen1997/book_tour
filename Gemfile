source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby "2.5.1"

gem "rails", "~> 5.2.3"
gem "mysql2"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "capistrano-rails", group: :development
gem "bootstrap-sass", "3.3.7"
gem "bootsnap", ">= 1.1.0", require: false
gem 'pry'
gem 'faker'        
gem 'will_paginate', '3.1.7'   
gem 'bootstrap-will_paginate'
gem 'bcrypt', '3.1.12'
gem 'jquery-rails'
gem "ransack"
gem "carrierwave"
gem "mini_magick"
gem "devise"
# gem "fog"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]