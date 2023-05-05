module Applicants
  class VisasController < ApplicationController
    def new
      @visa = Visa.new
    end

    def create
      @visa = Visa.new(visa_params)

      if @visa.valid?
        if @visa.eligible?
          session[:visa] = {
            'visa_type' => @visa.visa_type,
          }

          redirect_to new_applicants_entry_date_path
        else
          redirect_to ineligible_path
        end
      else
        render :new
      end
    end

    private

    def visa_params
      params.require(:applicants_visa).permit(:visa_type)
    end
  end
end