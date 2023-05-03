module Applicant
  class ContractEligibilitiesController < ApplicationController
    def new
      @contract_eligibility = ContractEligibility.new
    end

    def create
      @contract_eligibility = ContractEligibility.new(contract_eligibility_params)

      if @contract_eligibility.valid?
        if @contract_eligibility.eligible?
          session[:contract_eligibility] = {
            'contract_type' => @contract_eligibility.contract_type,
          }

          redirect_to new_applicant_personal_detail_path
        else
          redirect_to ineligible_path
        end
      else
        render :new
      end
    end

    private

    def contract_eligibility_params
      params.require(:applicant_contract_eligibility).permit(
        :contract_type,
      )
    end
  end
end