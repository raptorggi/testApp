source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# new rails 6.0 gems
gem "bootsnap"
gem "webpacker"

gem 'rails', '~> 6.0'
gem 'puma', '~> 4.3'

# old gems
gem "sentry-raven"

gem 'actionpack-action_caching'

gem 'rails-observers'

gem 'cashier', :git => 'https://github.com/forsaken1/cashier'
gem 'redis-rails'
gem 'devise'
gem 'devise-i18n'
gem 'activeadmin'
gem 'bootstrap-sass', '~> 3.3.6'

gem 'friendly_id', '~> 5.1.0'

gem 'jbuilder', '~> 2.10'
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'js_cookie_rails'
gem 'money-rails', '~>1'
gem 'paperclip', '~> 6.0.0'
gem 'pg'

gem 'rails-ujs', '~> 0.1.0'
gem 'russian', '~> 0.6.0'
# gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'whenever', require: false
gem 'omniauth-vkontakte'
# pdf creation
gem 'prawn'
gem 'prawn-table'
gem 'responders'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'

  gem 'database_cleaner'
  gem 'dotenv-rails'
  gem 'factory_bot_rails', '~> 4.10.0'
  gem 'poltergeist'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  
  gem 'phantomjs', :require => 'phantomjs/poltergeist'
  gem 'shoulda-matchers', '~> 3.1'
  # gem 'webdrivers', '~> 4.0'
  # gem 'selenium-webdriver'
  # gem 'chromedriver-helper'
  gem 'webdrivers'
end

group :development do
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
