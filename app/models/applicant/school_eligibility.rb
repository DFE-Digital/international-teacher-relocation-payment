module Applicant
  class SchoolEligibility
    include ActiveModel::Model
    attr_accessor :state_funded_secondary_school

    validates :state_funded_secondary_school, inclusion: { in: ["true", "false"] }
  end
end