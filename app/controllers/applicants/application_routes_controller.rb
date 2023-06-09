# frozen_string_literal: true

module Applicants
  class ApplicationRoutesController < ApplicationController
    def new
      @application_route = ApplicationRoute.new(application_route: params[:application_route])
    end

    def create
      @application_route = ApplicationRoute.new(application_route_params)

      if @application_route.valid?
        if @application_route.eligible?
          application = Application.create!(application_route: @application_route.application_route)
          session["application_id"] = application.id

          case @application_route.application_route
          when "teacher"
            redirect_to(new_applicants_school_detail_path)
          when "salaried_trainee"
            redirect_to(new_applicants_salaried_course_detail_path)
          end
        else
          redirect_to(ineligible_path)
        end
      else
        render(:new)
      end
    end

  private

    def application_route_params
      params.fetch(:applicants_application_route, {}).permit(:application_route)
    end
  end
end
