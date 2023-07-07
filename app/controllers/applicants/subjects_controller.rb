# frozen_string_literal: true

module Applicants
  class SubjectsController < ApplicationController
    before_action :check_application!
    def new
      @subject = Subject.new(subject: current_application.subject)
    end

    def create
      @subject = Subject.new(subject_params)

      if @subject.valid?
        if @subject.eligible?
          current_application.update!(subject: @subject.subject)

          redirect_to(new_applicants_visa_path)
        else
          redirect_to(ineligible_path)
        end
      else
        render(:new)
      end
    end

  private

    def subject_params
      params.fetch(:applicants_subject, {}).permit(:subject)
    end
  end
end
