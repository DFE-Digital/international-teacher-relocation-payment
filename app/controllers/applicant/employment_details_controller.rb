module Applicant
  class EmploymentDetailsController < ApplicationController
    def new
      @employment_detail = EmploymentDetail.new
    end

    def create
      @employment_detail = EmploymentDetail.new(employment_detail_params)

      if @employment_detail.valid?
        # Temporarily store the values in the session rather than the database.
        session[:employment_detail] = {
          'school_name' => @employment_detail.school_name,
          # 'school_address' => @employment_detail.school_address,
        }

        # Applicant.create!(applicant_params)
        # session.delete('')

        binding.pry
      else
        render :new
      end
    end

    private

    def employment_detail_params
      params.require(:applicant_employment_detail).permit(
        :school_name,
        :school_address,
      )
    end

    # def applicant_params
    #   employment_detail_params.merge(
    #     first_names: session['personal_detail']['first_names'],
    #     last_names: session['personal_detail']['last_names'],
    #   )
    # end
  end
end