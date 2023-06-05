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
    initial_checks_completed_at { rand(21..30).days.ago.to_date }
    visa_investigation_required { [false, true].sample }
    home_office_checks_completed_at { rand(11..20).days.ago.to_date }
    school_checks_completed_at { rand(1..10).days.ago.to_date }
    school_investigation_required { [false, true].sample }
    applicant
  end
end
