# frozen_string_literal: true

module Applicants
  class ContractStartDatesController < ApplicationController
    before_action :check_teacher!

    def new
      @contract_start_date = ContractStartDate.new
    end

    def create
      @contract_start_date = ContractStartDate.new(contract_start_date_params)

      if @contract_start_date.valid?
        session[:contract_start_date] = @contract_start_date.contract_start_date

        redirect_to(new_applicants_subject_path)
      else
        render(:new)
      end
    end

  private

    def contract_start_date_params
      params.require(:applicants_contract_start_date).permit(
        *DATE_CONVERSION.keys,
      ).transform_keys { |key| DATE_CONVERSION[key] }
    end

    DATE_CONVERSION = {
      "contract_start_date(3i)" => "day",
      "contract_start_date(2i)" => "month",
      "contract_start_date(1i)" => "year",
    }.freeze
    private_constant :DATE_CONVERSION
  end
end
