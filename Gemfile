# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

gem "bootsnap", require: false
gem "foreman"
gem "jbuilder"
gem "okcomputer"
gem "pg", "~> 1.1"
gem "puma", "~> 6.3"
gem "rails", "~> 7.0.6"
gem "sprockets-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "webpacker"

gem "pagy"

###############
# GOVUK GEMS ##
###############
# Used to build our forms and style them using govuk-frontend class names
gem "govuk-components", "4.1.0"
gem "govuk_design_system_formbuilder"
gem "notifications-ruby-client"
# UK postcode parsing and validation for Ruby
gem "uk_postcode"
# Phone number validations: https://design-system.service.gov.uk/patterns/telephone-numbers/
gem "phonelib"
###############

gem "config", "~> 4.2"
gem "httparty", "~> 0.21"

group :test do
  gem "shoulda-matchers", "~> 5.0"
  gem "simplecov", require: false
end
gem "factory_bot_rails"
gem "faker"

group :development, :test do
  gem "rubocop-govuk", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails"
  gem "rubocop-rspec"

  # Debugging
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "pry-byebug"

  # Better use of test helpers such as save_and_open_page/screenshot
  gem "launchy"

  # Testing framework
  gem "brakeman"
  gem "bundler-audit"
  gem "capybara"
  gem "dotenv-rails"
  gem "rspec-rails"
end

group :development do
  gem "annotate"
  gem "binding_of_caller"
  gem "web-console"
end
