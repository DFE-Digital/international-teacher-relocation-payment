# frozen_string_literal: true

module Applicants
  class TeachingDetail
    include ActiveModel::Model
    attr_accessor :fifty_percent

    # TODO: Consider saving this as a boolean but formatted Yes/No in UI and CSV
    OPTIONS = %w[yes no].freeze

    validates :fifty_percent, presence: true, inclusion: { in: OPTIONS }

    def eligible?
      fifty_percent == "yes"
    end
  end
end
