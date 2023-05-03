module Applicants
  class ApplicationType
    include ActiveModel::Model
    attr_accessor :application_type

    APPLICATION_TYPE_OPTIONS = %w[teacher salaried_trainee other]

    validates :application_type, presence: true, inclusion: { in: APPLICATION_TYPE_OPTIONS }

    def eligible?
      application_type != "other"
    end
  end
end