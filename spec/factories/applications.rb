# == Schema Information
#
# Table name: applications
#
#  id                :bigint           not null, primary key
#  application_date  :date
#  application_route :string
#  date_of_entry     :date
#  start_date        :date
#  subject           :string
#  urn               :string
#  visa_type         :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  applicant_id      :bigint
#
# Foreign Keys
#
#  fk_rails_...  (applicant_id => applicants.id)
#
FactoryBot.define do
  factory :application do
    application_route { %w[salaried_trainee teacher].sample }
    application_date { Faker::Date.in_date_period }
    applicant
    application_progress strategy: :build, factory: :application_progress
    subject { Applicants::Subject::TEACHER_SUBJECTS.sample }
    visa_type { Applicants::Visa::VISA_OPTIONS.sample }
    date_of_entry { Time.zone.today }
    start_date { 1.month.from_now.to_date }
    submitted

    factory :teacher_application do
      application_route { "teacher" }
      subject { Applicants::Subject::TEACHER_SUBJECTS.sample }
      applicant strategy: :create, factory: :applicant
    end

    factory :salaried_trainee_application do
      application_route { "salaried_trainee" }
      subject { Applicants::Subject::TRAINEE_SUBJECTS.sample }
      applicant strategy: :create, factory: :applicant
    end

    trait :submitted do
      urn { Urn.generate(application_route) }
    end

    trait :not_submitted do
      urn { nil }
    end

    trait :with_initial_checks_completed do
      application_progress strategy: :build, factory: %i[application_progress initial_checks_completed]
    end

    trait :with_visa_investigation_required do
      application_progress strategy: :build, factory: %i[application_progress visa_investigation_required]
    end

    trait :with_home_office_checks_completed do
      application_progress strategy: :build, factory: %i[application_progress home_office_checks_completed]
    end

    trait :with_school_investigation_required do
      application_progress strategy: :build, factory: %i[application_progress school_investigation_required]
    end

    trait :with_school_checks_completed do
      application_progress strategy: :build, factory: %i[application_progress school_checks_completed]
    end

    trait :with_banking_approval_completed do
      application_progress strategy: :build, factory: %i[application_progress banking_approval_completed]
    end

    trait :with_payment_confirmation_completed do
      application_progress strategy: :build, factory: %i[application_progress payment_confirmation_completed]
    end

    trait :with_rejection_completed do
      application_progress strategy: :build, factory: %i[application_progress rejection_completed]
    end
  end
end
