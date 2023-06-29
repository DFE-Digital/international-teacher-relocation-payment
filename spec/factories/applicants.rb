# == Schema Information
#
# Table name: applicants
#
#  id                :bigint           not null, primary key
#  application_route :string
#  date_of_birth     :date
#  date_of_entry     :date
#  email_address     :text
#  family_name       :text
#  given_name        :text
#  nationality       :text
#  passport_number   :text
#  phone_number      :text
#  sex               :text
#  subject           :text
#  visa_type         :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  school_id         :bigint
#
# Foreign Keys
#
#  fk_rails_...  (school_id => schools.id)
#
Faker::Config.locale = "en-GB"

FactoryBot.define do
  factory :applicant do
    application_route { %w[salaried_trainee teacher].sample }
    date_of_birth { rand(18..90).years.ago.to_date }
    date_of_entry { Time.zone.today }
    email_address { Faker::Internet.email }
    family_name { Faker::Name.last_name }
    given_name { Faker::Name.first_name }
    nationality { Faker::Nation.nationality }
    passport_number { Faker::Number.number(digits: 9) }
    phone_number { Faker::PhoneNumber.cell_phone_in_e164 }
    subject { %w[physics languages general_science].sample }
    visa_type { %w[visa_1 visa_2 visa_3].sample }
    sex { %w[female male].sample }

    association :school, factory: :school, strategy: :build

    after(:build) do |applicant|
      build(:address, addressable: applicant)
    end

    factory :teacher do
      application_route { "teacher" }
    end

    factory :salaried_trainee do
      application_route { "salaried_trainee" }
    end
  end

  trait :salaried_trainee do
    application_route { "salaried_trainee" }
  end

  trait :teacher do
    application_route { "teacher" }
  end

  trait :recently do
    created_at { rand(30..90).days.ago.to_date }
  end
end
