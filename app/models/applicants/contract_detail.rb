module Applicants
  class ContractDetail
    include ActiveModel::Model
    attr_accessor :one_year

    ONE_YEAR_OPTIONS = %w[yes no]

    validates :one_year, presence: true, inclusion: { in: ONE_YEAR_OPTIONS }

    def eligible?
      one_year == "yes"
    end
  end
end