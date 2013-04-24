source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'sqlite3'
gem 'jquery-rails'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem "better_errors"
end

group :development, :test, :staging do
  gem 'rspec-rails', '~> 2.0'
  gem 'pry'
  gem 'database_cleaner'
  gem 'selenium-webdriver', '~> 2.32.1'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'spork', '~> 1.0rc'
  gem 'fuubar'
end

