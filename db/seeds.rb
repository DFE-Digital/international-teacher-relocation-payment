# frozen_string_literal: true

# In order to reload the data, please run:
#
# $ bundle exec rails db:seed:replant
#

require "factory_bot_rails"

%i[
  teacher_application
  salaried_trainee_application
].each do |factory|
  FactoryBot.create_list(factory, 5, :with_rejection_completed)
  FactoryBot.create_list(factory, 5, :with_payment_confirmation_completed)
  FactoryBot.create_list(factory, 5, :with_banking_approval_completed)
  FactoryBot.create_list(factory, 5, :with_school_checks_completed)
  FactoryBot.create_list(factory, 5, :with_school_investigation_required)
  FactoryBot.create_list(factory, 5, :with_home_office_checks_completed)
  FactoryBot.create_list(factory, 5, :with_visa_investigation_required)
  FactoryBot.create_list(factory, 5, :with_initial_checks_completed)
end

if Rails.env.development?
  Setting.create!(
    service_start_date: 1.day.ago,
    service_end_date: 1.year.from_now,
  )
end
