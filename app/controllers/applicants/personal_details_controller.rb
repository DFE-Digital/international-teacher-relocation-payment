module Applicants
  class PersonalDetailsController < ApplicationController
    DOB_CONVERSION = {
      "date_of_birth(3i)" => "day",
      "date_of_birth(2i)" => "month",
      "date_of_birth(1i)" => "year",
    }.freeze

    def new
      @personal_detail = PersonalDetail.new
    end

    def create
      @personal_detail = PersonalDetail.new(personal_detail_params)

      if @personal_detail.valid?
        session[:personal_detail] = {
          "given_name" => @personal_detail.given_name,
          "family_name" => @personal_detail.family_name,
          "email_address" => @personal_detail.email_address,
          "phone_number" => @personal_detail.phone_number,
          "date_of_birth" => @personal_detail.date_of_birth,
          "sex" => @personal_detail.sex,
          "passport_number" => @personal_detail.passport_number,
        }

        redirect_to new_applicants_employment_detail_path
      else
        render :new
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
        *DOB_CONVERSION.keys,
      ).transform_keys do |key|
        DOB_CONVERSION.keys.include?(key) ? DOB_CONVERSION[key] : key
      end
    end
  end
end