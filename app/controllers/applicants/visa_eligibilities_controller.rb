module Applicants
  class VisaEligibilitiesController < ApplicationController
    def new
      @visa_eligibility = VisaEligibility.new
    end

    def create
      @visa_eligibility = VisaEligibility.new(visa_eligibility_params)

      if @visa_eligibility.valid?
        if @visa_eligibility.eligible?
          session[:visa_eligibility] = {
            'visa_type' => @visa_eligibility.visa_type,
          }

          redirect_to new_applicants_entry_date_path
        else
          redirect_to ineligible_path
        end
      else
        render :new
      end
    end

    private

    def visa_eligibility_params
      params.require(:applicants_visa_eligibility).permit(:visa_type)
    end
  end
end