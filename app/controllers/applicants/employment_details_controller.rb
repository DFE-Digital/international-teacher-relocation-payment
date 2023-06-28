# frozen_string_literal: true

module Applicants
  class EmploymentDetailsController < ApplicationController
    def new
      @employment_detail = EmploymentDetail.new
    end

    def create
      @employment_detail = EmploymentDetail.new(employment_detail_params)

      if @employment_detail.valid?
        @employment_detail.applicant = current_applicant
        @employment_detail.save!

        SubmitApplication.new(current_applicant).run

        redirect_to(applicants_submission_path)
      else
        render(:new)
      end
    end

  private

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
