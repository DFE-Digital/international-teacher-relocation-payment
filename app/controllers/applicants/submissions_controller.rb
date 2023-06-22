# frozen_string_literal: true

module Applicants
  class SubmissionsController < ApplicationController
    def show
      @application = current_applicant.application
    end
  end
end
