class ApplicantsController < ApplicationController
  def index
    @applicants = Applicant.all

    respond_to do |format|
      format.html
      format.csv do
        send_data(@applicants.to_csv, filename: "#{Time.zone.today}_GaIRP_applications.csv")
      end
    end
  end

  def show
    @applicant = Applicant.find(params["id"])
  end
end
