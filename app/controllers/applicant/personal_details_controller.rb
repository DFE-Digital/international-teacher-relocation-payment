module Applicant
  class PersonalDetailsController < ApplicationController
    def new
      @personal_detail = PersonalDetail.new
    end

    def create
      @personal_detail = PersonalDetail.new(personal_detail_params)

      if @personal_detail.valid?
        # Temporarily store the values in the session rather than the database.
        session[:personal_detail] = {
          'first_names' => @personal_detail.first_names,
          'last_names' => @personal_detail.last_names,
          'email' => @personal_detail.email,
        }

        redirect_to new_applicant_employment_detail_path
      else
        render :new
      end
    end

    private

    def personal_detail_params
      params.require(:applicant_personal_detail).permit(
        :first_names,
        :last_names,
        :email,
      )
    end
  end
end