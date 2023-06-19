# frozen_string_literal: true

module Applicants
  class EmploymentDetailsController < ApplicationController
    def new
      @employment_detail = EmploymentDetail.new
    end

    def create
      @employment_detail = EmploymentDetail.new(employment_detail_params)

      if @employment_detail.valid?
        @applicant = Applicant.find(session[:applicant_id])
        @applicant.create_school!(school_params)

        @applicant.create_application!(
          application_date: Date.current,
        )

        # TODO: Clean up data we've added to the session
        # session.delete('')
        redirect_to(submitted_path)
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

    def school_params
      {
        name: employment_detail_params["school_name"],
        headteacher_name: employment_detail_params["school_headteacher_name"],
        address_attributes: {
          address_line_1: employment_detail_params["school_address_line_1"],
          address_line_2: employment_detail_params["school_address_line_2"],
          city: employment_detail_params["school_city"],
          county: employment_detail_params["school_county"],
          postcode: employment_detail_params["school_postcode"],
        },
      }
    end
  end
end
