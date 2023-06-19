# frozen_string_literal: true

module Applicants
  class EmploymentDetailsController < ApplicationController
    before_action :set_applicant

    def new
      @employment_detail = EmploymentDetail.new
    end

    def create
      @employment_detail = EmploymentDetail.new(employment_detail_params)

      if @employment_detail.valid?
        @employment_detail.applicant = @applicant
        @employment_detail.save!

        Application.register_for_applicant!(@applicant)

        # TODO: Clean up data we've added to the session
        # session.delete('')
        redirect_to(applicants_submission_path)
      else
        render(:new)
      end
    end

  private

    def set_applicant
      @applicant = Applicant.find(session[:applicant_id])
    end

    def employment_detail_params
      params.require(:applicants_employment_detail).permit(
        :school_name,
        :school_headteacher_name,
        :school_address_line_1,
        :school_address_line_2,
        :school_city,
        :school_county,
        :school_postcode,
      )
    end
  end
end
