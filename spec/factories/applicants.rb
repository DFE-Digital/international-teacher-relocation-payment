# == Schema Information
#
# Table name: applicants
#
#  id                      :bigint           not null, primary key
#  given_name              :text
#  family_name             :text
#  email_address           :text
#  phone_number            :text
#  date_of_birth           :date
#  nationality             :text
#  sex                     :text
#  passport_number         :text
#  school_name             :text
#  subject                 :text
#  school_headteacher_name :text
#  visa_type               :text
#  date_of_entry           :date
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  application_route       :string
#  school_postcode         :string
#  address_line_1          :string
#  address_line_2          :string
#  city                    :string
#  county                  :string
#  postcode                :string
#
Faker::Config.locale = "en-GB"

FactoryBot.define do
  factory :applicant do
    application_route { %w[salaried_trainee teacher].sample }
    date_of_birth { rand(18..90).years.ago.to_date }
    date_of_entry { Time.zone.today }
    email_address { Faker::Internet.email }
    family_name { Faker::Name.last_name  }
    given_name { Faker::Name.first_name  }
    nationality { Faker::Nation.nationality }
    passport_number { Faker::Number.number(digits: 9) }
    phone_number { Faker::PhoneNumber.cell_phone_in_e164 }
    school_headteacher_name { Faker::Name.name }
    school_name { Faker::Educator.secondary_school }
    sex { %w[female male other].sample }
    subject { %w[physics languages general_science].sample }
    visa_type { %w[visa_1 visa_2 visa_3].sample }
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
