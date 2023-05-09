class Applicant < ApplicationRecord

  def full_name
    "#{given_name} #{family_name}"
  end
end