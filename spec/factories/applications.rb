# == Schema Information
#
# Table name: applications
#
#  id               :bigint           not null, primary key
#  application_date :date             not null
#  urn              :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  applicant_id     :bigint           not null
#
# Foreign Keys
#
#  fk_rails_...  (applicant_id => applicants.id)
#
FactoryBot.define do
  factory :application do
    application_date { Faker::Date.in_date_period }
    applicant
    application_progress { build(:application_progress) }

    factory :teacher_application do
      applicant { build(:teacher) }
    end

    factory :salaried_trainee_application do
      applicant { build(:salaried_trainee) }
    end

    trait :with_initial_checks_completed do
      association :application_progress, :initial_checks_completed, strategy: :build
    end

    trait :with_visa_investigation_required do
      association :application_progress, :visa_investigation_required, strategy: :build
    end

    trait :with_home_office_checks_completed do
      association :application_progress, :home_office_checks_completed, strategy: :build
    end

    trait :with_school_investigation_required do
      association :application_progress, :school_investigation_required, strategy: :build
    end

    trait :with_school_checks_completed do
      association :application_progress, :school_checks_completed, strategy: :build
    end

    trait :with_payment_completed do
      association :application_progress, :payment_completed, strategy: :build
    end
  end
end
