class ApplicantsController < ApplicationController
  before_action :find_applicant, only: %i[show edit update]

  def index
    @applicants = Applicant.all.order(created_at: :desc)

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
    @applicant ||= Applicant.find(params[:id])
  end
end
