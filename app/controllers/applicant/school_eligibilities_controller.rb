module Applicant
  class SchoolEligibilitiesController < ApplicationController
    def new
      @school_eligibility = SchoolEligibility.new
    end

    def create
      @school_eligibility = SchoolEligibility.new(school_eligibility_params)

      if @school_eligibility.valid?
        if @school_eligibility.eligible?
          # Temporarily store the values in the session rather than the database.
          session[:school_eligibility] = {
            'state_funded_secondary_school' => @school_eligibility.state_funded_secondary_school,
          }

          redirect_to new_applicant_contract_eligibility_path
        else
          redirect_to ineligible_path
        end
      else
        render :new
      end
    end

    private

    def school_eligibility_params
      params.require(:applicant_school_eligibility).permit(
        :state_funded_secondary_school,
      )
    end
  end
end