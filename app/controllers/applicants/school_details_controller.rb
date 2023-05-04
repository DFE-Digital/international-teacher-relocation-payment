module Applicants
  class SchoolDetailsController < ApplicationController
    def new
      @school_detail = SchoolDetail.new
    end

    def create
      @school_detail = SchoolDetail.new(school_detail_params)

      if @school_detail.valid?
        if @school_detail.eligible?
          # Temporarily store the values in the session rather than the database.
          session[:school_detail] = {
            'state_funded_secondary_school' => @school_detail.state_funded_secondary_school,
          }

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
      params.require(:applicants_school_detail).permit(
        :state_funded_secondary_school,
      )
    end
  end
end