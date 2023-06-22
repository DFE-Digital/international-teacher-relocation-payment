# frozen_string_literal: true

module Applicants
  class PersonalDetailsController < ApplicationController
    def new
      @personal_detail = PersonalDetail.new
    end

    def create
      @personal_detail = PersonalDetail.new(
        personal_detail_params.merge(
          application_route:,
        ),
      )

      if @personal_detail.valid?
        applicant = @personal_detail.save!
        session[:applicant_id] = applicant.id

        redirect_to(new_applicants_employment_detail_path)
      else
        render(:new)
      end
    end

  private

    def personal_detail_params
      params.require(:applicants_personal_detail).permit(
        :given_name,
        :family_name,
        :email_address,
        :phone_number,
        :sex,
        :passport_number,
        :nationality,
        :address_line_1,
        :address_line_2,
        :city,
        :county,
        :postcode,
        *DOB_CONVERSION.keys,
      ).transform_keys do |key|
        DOB_CONVERSION.key?(key) ? DOB_CONVERSION[key] : key
      end
    end

    DOB_CONVERSION = {
      "date_of_birth(3i)" => "day",
      "date_of_birth(2i)" => "month",
      "date_of_birth(1i)" => "year",
    }.freeze
    private_constant :DOB_CONVERSION
  end
end
