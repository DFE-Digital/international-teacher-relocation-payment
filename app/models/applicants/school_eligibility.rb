module Applicants
  class SchoolEligibility
    include ActiveModel::Model
    attr_accessor :state_funded_secondary_school

    SCHOOL_OPTIONS = %w[true false]

    validates :state_funded_secondary_school, presence: true,
              inclusion: { in: SCHOOL_OPTIONS }

    def eligible?
      ActiveModel::Type::Boolean.new.cast(state_funded_secondary_school)
    end
  end
end