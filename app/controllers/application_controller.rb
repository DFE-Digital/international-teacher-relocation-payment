class ApplicationController < ActionController::Base
  default_form_builder GOVUKDesignSystemFormBuilder::FormBuilder

  helper_method :application_type

  def application_type
    session["application_type"]
  end

  def check_teacher!
    if application_type != "teacher"
      redirect_to new_applicants_application_type_path
    end
  end

  def check_trainee!
    if application_type != "salaried_trainee"
      redirect_to new_applicants_application_type_path
    end
  end
end
