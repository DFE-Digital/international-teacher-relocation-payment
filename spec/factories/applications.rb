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
    urn { "IRP #{Faker::Number.number(digits: 6)} LT" }
    applicant
  end
end
