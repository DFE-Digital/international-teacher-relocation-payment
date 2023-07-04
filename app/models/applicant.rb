# frozen_string_literal: true

# == Schema Information
#
# Table name: applicants
#
#  id              :bigint           not null, primary key
#  date_of_birth   :date
#  email_address   :text
#  family_name     :text
#  given_name      :text
#  nationality     :text
#  passport_number :text
#  phone_number    :text
#  sex             :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  school_id       :bigint
#
# Foreign Keys
#
#  fk_rails_...  (school_id => schools.id)
#
class Applicant < ApplicationRecord
  # TODO: Add validations here so that a final check is made on the validity of
  # the whole application.

  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address

  belongs_to :school, dependent: :destroy, optional: true

  has_one :application, dependent: :destroy

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
