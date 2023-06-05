# == Schema Information
#
# Table name: applicants
#
#  id                      :bigint           not null, primary key
#  application_route       :string
#  date_of_birth           :date
#  date_of_entry           :date
#  email_address           :text
#  family_name             :text
#  given_name              :text
#  nationality             :text
#  passport_number         :text
#  phone_number            :text
#  school_headteacher_name :text
#  school_name             :text
#  sex                     :text
#  subject                 :text
#  visa_type               :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
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
end
