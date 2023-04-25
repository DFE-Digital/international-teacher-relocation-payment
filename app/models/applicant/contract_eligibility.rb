module Applicant
  class ContractEligibility
    include ActiveModel::Model
    attr_accessor :contract_type

    validates :contract_type, inclusion: { in: %w[permanent fixed_term other] }
  end
end