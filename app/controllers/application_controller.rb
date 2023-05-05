class ApplicationController < ActionController::Base
  default_form_builder GOVUKDesignSystemFormBuilder::FormBuilder

  helper_method :application_type

  def application_type
    session["application_type"]
  end
end
