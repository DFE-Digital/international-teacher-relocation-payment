# frozen_string_literal: true

Rails.logger.debug("Deleting all applicants and applicant progresses...")
Applicant.destroy_all if Rails.env.development?

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
