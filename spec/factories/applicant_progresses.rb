# == Schema Information
#
# Table name: applicant_progresses
#
#  id                              :bigint           not null, primary key
#  home_office_checks_completed_at :date
#  initial_checks_completed_at     :date
#  school_checks_completed_at      :date
#  school_investigation_required   :boolean
#  visa_investigation_required     :boolean
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  application_id                  :bigint           not null
#
FactoryBot.define do
  factory :application_progress do
    # nop
  end

  trait :with_initial_checks_completed do
    initial_checks_completed_at { rand(21..30).days.ago.to_date }
  end

  trait :with_visa_investigation_required do
    with_initial_checks_completed

    visa_investigation_required { true }
  end

  trait :with_home_office_checks_completed do
    with_visa_investigation_required

    home_office_checks_completed_at { rand(11..20).days.ago.to_date }
  end

  trait :with_school_investigation_required do
    with_school_investigation_required

    school_investigation_required { true }
  end

  trait :with_school_checks_completed do
    with_school_investigation_required

    school_checks_completed_at { rand(1..10).days.ago.to_date }
  end

  trait :with_teacher do
    association :applicant, factory: %i[applicant teacher recently]
  end

  trait :with_salaried_trainee do
    association :applicant, factory: %i[applicant salaried_trainee recently]
  end
end
