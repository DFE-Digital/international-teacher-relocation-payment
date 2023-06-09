# frozen_string_literal: true

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
class Applicant < ApplicationRecord
  # TODO: Add validations here so that a final check is made on the validity of
  # the whole application.

  has_one :applicant_progress, dependent: :destroy

  delegate \
    :initial_checks_completed_at,
    :visa_investigation_required,
    :home_office_checks_completed_at,
    :school_investigation_required,
    :school_checks_completed_at,
    :approval_completed_at,
    :payment_completed_at,
    :rejection_completed_at,
    :status,
    to: :applicant_progress

  def self.ransackable_attributes(_auth_object = nil)
    %w[email_address family_name given_name passport_number]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[applicant_progress]
  end

  def full_name
    "#{given_name} #{family_name}"
  end

  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << attribute_names

      all.find_each do |applicant|
        csv << applicant.attributes.values
      end
    end
  end
end
