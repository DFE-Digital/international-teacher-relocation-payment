module Applicants
  class ContractEligibility
    include ActiveModel::Model
    attr_accessor :contract_type

    CONTRACT_TYPE_OPTIONS = %w[permanent fixed_term other]

    validates :contract_type, inclusion: { in: CONTRACT_TYPE_OPTIONS }

    def eligible?
      contract_type != "other"
    end
  end
end