# frozen_string_literal: true

class ApplicationController < ActionController::Base
  default_form_builder GOVUKDesignSystemFormBuilder::FormBuilder

  def application_route
    current_application.application_route
  end
  helper_method :application_route

  def current_application
    Application.find(session["application_id"])
  end
  helper_method :current_application

  def current_applicant
    current_application.applicant
  end
  helper_method :current_applicant

  def check_teacher!
    return unless application_route != "teacher"

    redirect_to(new_applicants_application_route_path)
  end

  def check_trainee!
    return unless application_route != "salaried_trainee"

    redirect_to(new_applicants_application_route_path)
  end
end
