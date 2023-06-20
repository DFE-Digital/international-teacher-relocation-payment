# frozen_string_literal: true

module Applicants
  class Visa
    include ActiveModel::Model
    attr_accessor :visa_type

    VISA_OPTIONS = [
      "Afghan Relocations and Assistance Policy",
      "Afghan citizens resettlement scheme",
      "British National (Overseas) visa",
      "Family visa",
      "High Potential Individual visa",
      "India Young Professionals Scheme visa",
      "Skilled worker visa",
      "UK Ancestry visa",
      "Ukraine Family Scheme visa",
      "Ukraine Sponsorship Scheme",
      "Youth Mobility Scheme",
      "Other",
    ].freeze

    validates :visa_type, presence: true, inclusion: { in: VISA_OPTIONS }

    def eligible?
      visa_type != "Other"
    end
  end
end
