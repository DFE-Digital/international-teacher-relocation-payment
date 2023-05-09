class Applicant < ApplicationRecord

  def full_name
    "#{given_name} #{family_name}"
  end

  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << self.attribute_names

      all.find_each do |applicant|
        csv << applicant.attributes.values
      end
    end
  end
end