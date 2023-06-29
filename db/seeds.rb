# frozen_string_literal: true

Rails.logger.debug("Deleting all applicants and applicant progresses...")
Applicant.destroy_all if Rails.env.development?

FactoryBot.create_list(:teacher_application, 5, :with_initial_checks_completed)
FactoryBot.create_list(:teacher_application, 5, :with_visa_investigation_required)
FactoryBot.create_list(:teacher_application, 5, :with_home_office_checks_completed)
FactoryBot.create_list(:teacher_application, 5, :with_school_investigation_required)
FactoryBot.create_list(:teacher_application, 5, :with_school_checks_completed)

FactoryBot.create_list(:salaried_trainee_application, 5, :with_initial_checks_completed)
FactoryBot.create_list(:salaried_trainee_application, 5, :with_visa_investigation_required)
FactoryBot.create_list(:salaried_trainee_application, 5, :with_home_office_checks_completed)
FactoryBot.create_list(:salaried_trainee_application, 5, :with_school_investigation_required)
FactoryBot.create_list(:salaried_trainee_application, 5, :with_school_checks_completed)
