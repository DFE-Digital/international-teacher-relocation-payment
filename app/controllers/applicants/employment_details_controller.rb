# frozen_string_literal: true

module Applicants
  class EmploymentDetailsController < ApplicationController
    def new
      @employment_detail = EmploymentDetail.new
    end

    def create
      @employment_detail = EmploymentDetail.new(employment_detail_params)

      if @employment_detail.valid?
        @applicant = Applicant.create!(applicant_params)
        @applicant.create_school!(school_params)
        @applicant.create_address!(address_params)

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
        :school_postcode,
        :school_headteacher_name,
      )
    end

    def applicant_params
      {
        application_route: session["application_route"],
        given_name: session["personal_detail"]["given_name"],
        family_name: session["personal_detail"]["family_name"],
        email_address: session["personal_detail"]["email_address"],
        phone_number: session["personal_detail"]["phone_number"],
        date_of_birth: session["personal_detail"]["date_of_birth"],
        sex: session["personal_detail"]["sex"],
        nationality: session["personal_detail"]["nationality"],
        passport_number: session["personal_detail"]["passport_number"],
        subject: session["subject"],
        visa_type: session["visa_type"],
        date_of_entry: session["entry_date"],
      }
    end

    def school_params
      {
        name: employment_detail_params["school_name"],
        postcode: employment_detail_params["school_postcode"],
        headteacher_name: employment_detail_params["school_headteacher_name"],
      }
    end

    def address_params
      {
        addressable_id: @applicant.id,
        addressable_type: "Applicant",
        address_line_1: session["personal_detail"]["address_line_1"],
        address_line_2: session["personal_detail"]["address_line_2"],
        city: session["personal_detail"]["city"],
        county: session["personal_detail"]["county"],
        postcode: session["personal_detail"]["postcode"],
      }
    end
  end
end
