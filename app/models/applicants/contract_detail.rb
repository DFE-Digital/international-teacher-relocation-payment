# frozen_string_literal: true

module Applicants
  class ContractDetail
    include ActiveModel::Model
    attr_accessor :one_year

    # TODO: Consider saving this as a boolean but formatted Yes/No in UI and CSV
    ONE_YEAR_OPTIONS = %w[yes no].freeze

    validates :one_year, presence: true, inclusion: { in: ONE_YEAR_OPTIONS }

    def eligible?
      one_year == "yes"
    end
  end
end
