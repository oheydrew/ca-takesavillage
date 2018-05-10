source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'

# ------------------------------------- NON DEFAULT GEMS

# Use devise for user authentication 
gem 'devise', '~> 4.4', '>= 4.4.3'
# Use pundit for user authorization
gem 'pundit'
# Use dotenv-rails for environment varibles
gem 'dotenv-rails'

# Use geocoder for geocode data
gem 'geocoder'
# Use country_select for country codes
gem 'country_select'
# Use ausburbs for australian suburb data
gem 'ausburbs'
# Use mailgun-rails for mailing
gem 'mailgun-ruby'
# Use stripe for payments
gem 'stripe'
# pry for debugging
gem 'pry'

# Use shrine for image upload management
gem 'shrine' , '~> 2.11', '>= 2.11'
# Use image_process for image conversion
gem 'image_processing', '~> 1.0'
# Use aws-s3 buckets for image storage
gem "aws-sdk-s3", "~> 1.2" 

# Use acts-as-taggable-on for tags
gem 'acts-as-taggable-on', '~> 4.0'
# For validating date/time input format
gem 'validates_timeliness', '~> 4.0'

# ------------------------------------- RAILS DEFAULT

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do

# ------------------------------------- NON STANDARD GEMS

  # rspec
  gem 'rspec-rails', '~> 3.7'
  # Adds should matchers to rspec tests
  gem 'shoulda-matchers'
  # factorygirl - makes objects for tests
  gem 'factory_bot_rails'
  # faker can fill those factories with fake data
  gem 'faker'
  # cleans database between tests
  gem 'database_cleaner', '~> 1.5'
  # Pretty rails console tables
  gem 'hirb'

# ------------------------------------- RAILS DEFAULT

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
