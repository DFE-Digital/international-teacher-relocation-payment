# frozen_string_literal: true

class ApplicationController < ActionController::Base
  default_form_builder GOVUKDesignSystemFormBuilder::FormBuilder

  # TODO: Consider renaming to application_route to match language of question
  helper_method :application_route

  def application_route
    session["application_route"]
  end

  def check_teacher!
    if application_route != "teacher"
      redirect_to new_applicants_application_route_path
    end
  end

  def check_trainee!
    if application_route != "salaried_trainee"
      redirect_to new_applicants_application_route_path
    end
  end
end
