# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

gem "bootsnap", require: false
gem "foreman"
gem "jbuilder"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "webpacker"

###############
# GOVUK GEMS ##
###############
# Used to build our forms and style them using govuk-frontend class names
gem "govuk-components", "3.0.3"
gem "govuk_design_system_formbuilder"
# UK postcode parsing and validation for Ruby
gem "uk_postcode"
###############

gem "config", "~> 4.1"
gem "httparty", "~> 0.21"

group :test do
  gem "shoulda-matchers", "~> 5.0"
end

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rubocop-govuk", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails"
  gem "rubocop-rspec"

  # Debugging
  gem "launchy"
  gem "pry-byebug"
  # Testing framework
  gem "capybara"
  gem "dotenv-rails"
  gem "rspec-rails"
end

group :development do
  gem "web-console"
end
