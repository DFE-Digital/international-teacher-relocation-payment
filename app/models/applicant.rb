# frozen_string_literal: true

class Applicant < ApplicationRecord
  # TODO: Add validations here so that a final check is made on the validity of
  # the whole application.

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
