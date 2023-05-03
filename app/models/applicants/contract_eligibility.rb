module Applicants
  class ContractEligibility
    include ActiveModel::Model
    attr_accessor :one_year_contract

    ONE_YEAR_CONTRACT_OPTIONS = %w[yes no]

    validates :one_year_contract, presence: true, inclusion: { in: ONE_YEAR_CONTRACT_OPTIONS }

    def eligible?
      one_year_contract == "yes"
    end
  end
end