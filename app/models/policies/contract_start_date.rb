# frozen_string_literal: true

# The `ContractStartDate` class defines the policy for contract start dates.
#
# This policy determines whether a given start date is eligible based on the
# rule that employment start dates from the first Monday in July are considered
# eligible.
#
# It calculates the first Monday in July of the current year and compares
# it with the given start date to determine eligibility.
#
# @example
#   Policies::ContractStartDate.eligible?(Date.new(2023, 7, 3)) #=> true
#
# @example
#   Policies::ContractStartDate.eligible?(Date.new(2023, 6, 30)) #=> false
#
module Policies
  class ContractStartDate
    def self.eligible?(start_date)
      current_year = Date.current.year
      first_monday_in_july = Date.new(current_year, 7, 1)
                                 .beginning_of_month
                                 .next_occurring(:monday)

      start_date >= first_monday_in_july
    end
  end
end
