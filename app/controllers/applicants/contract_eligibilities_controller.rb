module Applicants
  class ContractEligibilitiesController < ApplicationController
    def new
      @contract_eligibility = ContractEligibility.new
    end

    def create
      @contract_eligibility = ContractEligibility.new(contract_eligibility_params)

      if @contract_eligibility.valid?
        if @contract_eligibility.eligible?
          session[:contract_eligibility] = {
            'one_year_contract' => @contract_eligibility.one_year_contract,
          }

          redirect_to new_applicants_contract_start_date_path
        else
          redirect_to ineligible_path
        end
      else
        render :new
      end
    end

    private

    def contract_eligibility_params
      params.require(:applicants_contract_eligibility).permit(
        :one_year_contract,
      )
    end
  end
end