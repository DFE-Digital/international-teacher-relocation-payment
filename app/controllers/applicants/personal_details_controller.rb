module Applicants
  class PersonalDetailsController < ApplicationController
    def new
      @personal_detail = PersonalDetail.new
    end

    def create
      @personal_detail = PersonalDetail.new(personal_detail_params)

      if @personal_detail.valid?
        session[:personal_detail] = {
          'given_name' => @personal_detail.given_name,
          'family_name' => @personal_detail.family_name,
          'email_address' => @personal_detail.email_address,
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
      )
    end
  end
end