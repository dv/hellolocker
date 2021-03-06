source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'thin'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'devise'

gem 'whenever', require: false

gem 'haml-rails'
gem 'hashids'
gem 'rails-settings-cached'

gem 'react-rails'
gem 'browserify-rails'

gem 'annotations'

gem 'bootstrap', git: 'https://github.com/twbs/bootstrap-rubygem'

group :development, :test do
  gem 'pry', require: "pry"
  gem 'launchy'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry-byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'dotenv-rails'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'poltergeist', path: "~/poetry/dv/poltergeist"
  gem 'factory_girl_rails'
  gem 'database_cleaner'

  gem 'teaspoon-mocha'
  gem 'guard-teaspoon'
end

group :development do
  gem 'guard-rspec', require: false
  gem 'terminal-notifier-guard'
  gem 'quiet_assets'
  gem 'annotate'
end

group :test do
  gem 'coveralls', require: false
end

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end

