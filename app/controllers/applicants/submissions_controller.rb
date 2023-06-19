# frozen_string_literal: true

module Applicants
  class SubmissionsController < ApplicationController
    def show
      applicant = Applicant.find(session[:applicant_id])

      @application = applicant.application
    end
  end
end
