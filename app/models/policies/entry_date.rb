# frozen_string_literal: true

# The `EntryDate` class defines the policy for contract start dates.
#
# This Policy determines whether a given entry date is eligible based on the
# start date of the contract. If the applicant entered the country 3 months
# or less before the start of the contract, then they are eligible.
#
# @example
#   Policies::ContractStartDate.eligible?(
#     Date.new(2023, 1, 2),
#     Date.new(2023, 4, 2)
#   ) #=> true
#
module Policies
  class EntryDate
    def self.eligible?(entry_date, start_date)
      entry_date >= start_date - 3.months
    end
  end
end
