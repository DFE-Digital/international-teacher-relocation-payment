# frozen_string_literal: true

# In order to reload the data, please run:
#
# $ bundle exec rails db:seeds:replant
#

%i[
  teacher_application
  salaried_trainee_application
].each do |factory|
  FactoryBot.create_list(factory, 5, :with_initial_checks_completed)
  FactoryBot.create_list(factory, 5, :with_visa_investigation_required)
  FactoryBot.create_list(factory, 5, :with_home_office_checks_completed)
  FactoryBot.create_list(factory, 5, :with_school_investigation_required)
  FactoryBot.create_list(factory, 5, :with_school_checks_completed)
end
