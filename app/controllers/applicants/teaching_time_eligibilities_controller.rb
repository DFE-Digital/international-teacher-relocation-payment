module Applicants
  class TeachingTimeEligibilitiesController < ApplicationController
    def new
      @teaching_time_eligibility = TeachingTimeEligibility.new
    end

    def create
      @teaching_time_eligibility = TeachingTimeEligibility.new(teaching_time_eligibility_params)

      if @teaching_time_eligibility.valid?
        if @teaching_time_eligibility.eligible?
          session[:teaching_time_eligibility] = {
            'fifty_percent' => @teaching_time_eligibility.fifty_percent,
          }

          redirect_to new_applicants_visa_eligibility_path
        else
          redirect_to ineligible_path
        end
      else
        render :new
      end
    end

    private

    def teaching_time_eligibility_params
      params.require(:applicants_teaching_time_eligibility).permit(:fifty_percent)
    end
  end
end