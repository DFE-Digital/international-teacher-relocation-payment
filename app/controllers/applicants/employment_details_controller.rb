module Applicants
  class EmploymentDetailsController < ApplicationController
    def new
      @employment_detail = EmploymentDetail.new
    end

    def create
      @employment_detail = EmploymentDetail.new(employment_detail_params)

      if @employment_detail.valid?
        Applicant.create!(applicant_params)
        # session.delete('')
        redirect_to submitted_path
      else
        render :new
      end
    end

    private

    def employment_detail_params
      params.require(:applicants_employment_detail).permit(:school_name)
    end

    def applicant_params
      employment_detail_params.merge(
        given_name: session["personal_detail"]["given_name"],
        family_name: session["personal_detail"]["family_name"],
        email_address: session["personal_detail"]["email_address"],
      )
    end
  end
end