module Applicants
  class TeachingTimeEligibility
    include ActiveModel::Model
    attr_accessor :fifty_percent

    OPTIONS = %w[yes no]

    validates :fifty_percent, presence: true, inclusion: { in: OPTIONS }

    def eligible?
      fifty_percent == "yes"
    end
  end
end