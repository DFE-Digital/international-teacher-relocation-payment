# frozen_string_literal: true

Rails.logger.debug("Deleting all applicants and applicant progresses...")
Applicant.destroy_all if Rails.env.development?

%i[with_salaried_trainee with_teacher].each do |route|
  Rails.logger.debug { "Creating #{route} applicants..." }
  FactoryBot.create_list(:application_progress, 5, :with_initial_checks_completed, route)
  FactoryBot.create_list(:application_progress, 5, :with_visa_investigation_required, route)
  FactoryBot.create_list(:application_progress, 5, :with_home_office_checks_completed, route)
  FactoryBot.create_list(:application_progress, 5, :with_school_investigation_required, route)
  FactoryBot.create_list(:application_progress, 5, :with_school_checks_completed, route)
end
