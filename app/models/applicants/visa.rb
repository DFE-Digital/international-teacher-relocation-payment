# frozen_string_literal: true

module Applicants
  class Visa
    include ActiveModel::Model
    attr_accessor :visa_type

    VISA_OPTIONS = %w[visa_1 visa_2 visa_3 other].freeze

    validates :visa_type, presence: true, inclusion: { in: VISA_OPTIONS }

    def eligible?
      visa_type != "other"
    end
  end
end
