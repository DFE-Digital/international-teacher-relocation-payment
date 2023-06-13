# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

gem "bootsnap", require: false
gem "foreman"
gem "jbuilder"
gem "pg", "~> 1.1"
gem "puma", "~> 6.3"
gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "webpacker"

###############
# GOVUK GEMS ##
###############
# Used to build our forms and style them using govuk-frontend class names
gem "govuk-components", "4.0.0"
gem "govuk_design_system_formbuilder"
# UK postcode parsing and validation for Ruby
gem "uk_postcode"
###############

gem "config", "~> 4.1"
gem "httparty", "~> 0.21"

group :test do
  gem "shoulda-matchers", "~> 5.0"
  gem "simplecov", require: false
end

group :development, :test do
  gem "factory_bot_rails"
  gem "rubocop-govuk", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails"
  gem "rubocop-rspec"

  gem "faker"

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
