module Applicants
  class SubjectEligibilitiesController < ApplicationController
    def new
      @subject_eligibility = SubjectEligibility.new
    end

    def create
      @subject_eligibility = SubjectEligibility.new(subject_eligibility_params)

      if @subject_eligibility.valid?
        if @subject_eligibility.eligible?
          session[:subject_eligibility] = {
            'subject' => @subject_eligibility.subject,
          }

          redirect_to new_applicants_teaching_time_eligibility_path
        else
          redirect_to ineligible_path
        end
      else
        render :new
      end
    end

    private

    def subject_eligibility_params
      params.require(:applicants_subject_eligibility).permit(:subject)
    end
  end
end