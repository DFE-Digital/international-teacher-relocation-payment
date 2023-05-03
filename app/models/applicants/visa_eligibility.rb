module Applicants
  class VisaEligibility
    include ActiveModel::Model
    attr_accessor :visa_type

    VISA_OPTIONS = %w[visa_1 visa_1 visa_3 other]

    validates :visa_type, presence: true, inclusion: { in: VISA_OPTIONS }

    def eligible?
      visa_type != "other"
    end
  end
end