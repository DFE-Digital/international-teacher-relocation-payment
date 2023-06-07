# frozen_string_literal: true

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
    to: :applicant_progress

  scope :nationality_breakdown, -> { group(:nationality).order("count_id DESC").count(:id) }
  scope :gender_breakdown, -> { group(:sex).order("count_id DESC").count(:id) }
  scope :visa_breakdown, -> { group(:visa_type).order("count_id DESC").count(:id) }
  scope :route_breakdown, -> { group(:application_route).order("count_id DESC").count(:id) }

  def full_name
    "#{given_name} #{family_name}"
  end

  def self.age_group_breakdown
    ages = Applicant.select("*, FLOOR(EXTRACT(YEAR FROM AGE(NOW(), date_of_birth))) as age").filter_map(&:age)

    age_groups = Hash.new(0)

    ages.each do |age|
      case age
      when 18..25
        age_groups["18-25"] += 1
      when 26..35
        age_groups["26-35"] += 1
      when 36..45
        age_groups["36-45"] += 1
      when 46..55
        age_groups["46-55"] += 1
      when 56..65
        age_groups["56-65"] += 1
      when 66..75
        age_groups["66-75"] += 1
      when 76..85
        age_groups["76-85"] += 1
      when 86..95
        age_groups["86-95"] += 1
      else
        age_groups["Other"] += 1
      end
    end

    age_groups
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
