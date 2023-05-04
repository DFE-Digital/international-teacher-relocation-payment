module Applicants
  class SchoolDetail
    include ActiveModel::Model
    attr_accessor :state_funded_secondary_school

    SCHOOL_OPTIONS = %w[yes no]

    validates :state_funded_secondary_school, presence: true, inclusion: { in: SCHOOL_OPTIONS }

    def eligible?
      state_funded_secondary_school == "yes"
    end
  end
end