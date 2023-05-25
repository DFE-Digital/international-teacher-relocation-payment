# frozen_string_literal: true

module Applicants
  class SchoolDetail
    include ActiveModel::Model
    attr_accessor :state_funded_secondary_school

    # TODO: Consider saving this as a boolean but formatted Yes/No in UI and CSV
    SCHOOL_OPTIONS = %w[yes no]

    validates :state_funded_secondary_school, presence: true, inclusion: { in: SCHOOL_OPTIONS }

    def eligible?
      state_funded_secondary_school == "yes"
    end
  end
end