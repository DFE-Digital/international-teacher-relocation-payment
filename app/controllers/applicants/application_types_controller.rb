module Applicants
  class ApplicationTypesController < ApplicationController
    def new
      @application_type = ApplicationType.new
    end

    def create
      @application_type = ApplicationType.new(application_type_params)

      if @application_type.valid?
        if @application_type.eligible?
          session[:application_type] = @application_type.application_type

          if @application_type.application_type == "teacher"
            redirect_to new_applicants_school_detail_path
          elsif @application_type.application_type == "salaried_trainee"
            redirect_to new_applicants_salaried_course_detail_path
          end
        else
          redirect_to ineligible_path
        end
      else
        render :new
      end
    end

    private

    def application_type_params
      params.require(:applicants_application_type).permit(:application_type)
    end
  end
end