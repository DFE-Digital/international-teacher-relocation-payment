# frozen_string_literal: true

module Applicants
  class ContractDetailsController < ApplicationController
    before_action :check_application!
    before_action :check_teacher!

    def new
      @contract_detail = ContractDetail.new(one_year: params[:one_year])
    end

    def create
      @contract_detail = ContractDetail.new(contract_detail_params)

      if @contract_detail.valid?
        if @contract_detail.eligible?

          redirect_to(new_applicants_contract_start_date_path)
        else
          redirect_to(ineligible_path)
        end
      else
        render(:new)
      end
    end

  private

    def contract_detail_params
      params.fetch(:applicants_contract_detail, {}).permit(:one_year)
    end
  end
end
