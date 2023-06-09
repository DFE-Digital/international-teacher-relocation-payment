# == Schema Information
#
# Table name: applicant_progresses
#
#  id                              :bigint           not null, primary key
#  approval_completed_at           :date
#  home_office_checks_completed_at :date
#  initial_checks_completed_at     :date
#  payment_completed_at            :date
#  rejection_completed_at          :date
#  school_checks_completed_at      :date
#  school_investigation_required   :boolean
#  status                          :integer
#  visa_investigation_required     :boolean
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  applicant_id                    :bigint           not null
#
# Indexes
#
#  index_applicant_progresses_on_applicant_id  (applicant_id)
#
# Foreign Keys
#
#  fk_rails_...  (applicant_id => applicants.id)
#
FactoryBot.define do
  factory :applicant_progress do
    applicant
  end

  trait :with_initial_checks_completed do
    initial_checks_completed_at { rand(21..30).days.ago.to_date }
  end

  trait :with_visa_investigation_required do
    initial_checks_completed_at { rand(21..30).days.ago.to_date }
    visa_investigation_required { true }
  end

  trait :with_home_office_checks_completed do
    initial_checks_completed_at { rand(21..30).days.ago.to_date }
    visa_investigation_required { true }
    home_office_checks_completed_at { rand(11..20).days.ago.to_date }
  end

  trait :with_school_investigation_required do
    initial_checks_completed_at { rand(21..30).days.ago.to_date }
    visa_investigation_required { true }
    home_office_checks_completed_at { rand(11..20).days.ago.to_date }
    school_investigation_required { true }
  end

  trait :with_school_checks_completed do
    initial_checks_completed_at { rand(21..30).days.ago.to_date }
    visa_investigation_required { true }
    home_office_checks_completed_at { rand(11..20).days.ago.to_date }
    school_investigation_required { true }
    school_checks_completed_at { rand(1..10).days.ago.to_date }
  end

  trait :with_teacher do
    association :applicant, factory: %i[applicant teacher recently]
  end

  trait :with_salaried_trainee do
    association :applicant, factory: %i[applicant salaried_trainee recently]
  end
end
