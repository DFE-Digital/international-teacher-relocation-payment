# frozen_string_literal: true

module Applicants
  class ApplicationRoute
    include ActiveModel::Model
    attr_accessor :application_route

    APPLICATION_ROUTE_OPTIONS = %w[salaried_trainee teacher other]

    validates :application_route, presence: true, inclusion: { in: APPLICATION_ROUTE_OPTIONS }

    def eligible?
      application_route != "other"
    end
  end
end