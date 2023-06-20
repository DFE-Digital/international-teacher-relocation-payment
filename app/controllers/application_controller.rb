# frozen_string_literal: true

class ApplicationController < ActionController::Base
  default_form_builder GOVUKDesignSystemFormBuilder::FormBuilder

  helper_method :application_route

  def application_route
    session["application_route"]
  end

  def current_applicant
    Applicant.find(session[:applicant_id])
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
