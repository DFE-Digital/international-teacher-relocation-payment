# frozen_string_literal: true

# TODO: Policy to allow only signed in admins to access anything in this module.
module SystemAdmin
  class ApplicantsController < AdminController
    default_form_builder GOVUKDesignSystemFormBuilder::FormBuilder

    before_action :find_applicant, only: %i[show edit update]

    include Pagy::Backend

    def index
      @pagy, @applicants = pagy(Applicant.order(created_at: :desc))

      respond_to do |format|
        format.html
        format.csv do
          send_data(@applicants.to_csv, filename: "#{Time.zone.today}_GaIRP_applications.csv")
        end
      end
    end

    def show; end

    def edit; end

    def update
      if @applicant.update(applicant_params)
        redirect_to(applicant_path(@applicant))
      else
        render(:edit)
      end
    end

  private

    def applicant_params
      params.require(:applicant).permit(
        :initial_checks_completed_at,
        :visa_investigation_required,
        :home_office_checks_completed_at,
        :school_investigation_required,
        :school_checks_completed_at,
      )
    end

    def find_applicant
      @applicant = Applicant.find(params[:id])
      @application = @applicant.application
      @progress = @application.application_progress
    end
  end
end
