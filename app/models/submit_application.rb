class SubmitApplication
  def initialize(applicant)
    @applicant = applicant
  end

  def run
    @application = create_application
    send_email_to_applicant

    @application
  end

private

  def create_application
    Application.create!(
      applicant: @applicant,
      application_date: Date.current.to_s,
      application_progress: ApplicationProgress.new,
    )
  end

  def send_email_to_applicant
    template_id = ENV.fetch("GOVUK_NOTIFY_APPLICATION_SUBMITTED_TEMPLATE_ID")
    email_address = @applicant.email_address
    application_id = @application.urn

    GovukNotify::Client.send_email(
      template_id,
      email_address,
      application_id,
    )
  end
end
