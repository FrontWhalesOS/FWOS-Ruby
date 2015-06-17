source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
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

#Postgres for database
#https://github.com/ged/ruby-pg
gem 'pg'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
#Pry enables to test snippets of codes.
  gem 'pry'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
#The CORS spec allows web applications to make cross domain
#AJAX calls without using workarounds such as JSONP.
#https://github.com/cyu/rack-cors
    gem 'rack-cors', require: 'rack/cors'
#This gem enables serving assets in production and setting your
#logger to standard out, both of which are required to run a Rails 4
#application on a twelve-factor provider. The gem also makes the appropriate changes for Rails 3 apps.
#https://github.com/heroku/rails_12factor
    gem 'rails_12factor'
end

#This release includes a security fix for a DoS vulnerability of REXML.
#It is similar to the fixed vulnerability in the previous release, but new and different from it.
#https://www.ruby-lang.org/en/news/2014/11/13/ruby-2-1-5-is-released/

ruby "2.1.5"