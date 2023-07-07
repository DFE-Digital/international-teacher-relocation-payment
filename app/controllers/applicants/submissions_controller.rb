# frozen_string_literal: true

module Applicants
  class SubmissionsController < ApplicationController
    before_action :check_application!

    def show
      @application = current_application

      session[:application_id] = nil
    end
  end
end
