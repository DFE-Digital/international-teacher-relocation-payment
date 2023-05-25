# frozen_string_literal: true

module Applicants
  class SchoolDetailsController < ApplicationController
    before_action :check_teacher!

    def new
      @school_detail = SchoolDetail.new
    end

    def create
      @school_detail = SchoolDetail.new(school_detail_params)

      if @school_detail.valid?
        if @school_detail.eligible?
          session[:state_funded_secondary_school] = @school_detail.state_funded_secondary_school

          redirect_to new_applicants_contract_detail_path
        else
          redirect_to ineligible_path
        end
      else
        render :new
      end
    end

    private

    def school_detail_params
      params.fetch(:applicants_school_detail, {}).permit(:state_funded_secondary_school)
    end
  end
end