# frozen_string_literal: true

module Applicants
  class SubmissionsController < ApplicationController
    def show
      @application = current_application

      session[:application_id] = nil
    end
  end
end
