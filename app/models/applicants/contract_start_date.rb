module Applicants
  class ContractStartDate
    include ActiveModel::Model
    include DateHelpers
    attr_accessor :day, :month, :year

    validates :contract_start_date, presence: true

    def contract_start_date
      date_from_hash
    end
  end
end