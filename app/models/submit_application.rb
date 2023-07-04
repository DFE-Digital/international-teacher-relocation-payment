class SubmitApplication
  def initialize(application)
    @application = application
  end

  def run
    create_application
    send_email_to_applicant

    @application
  end

private

  def create_application
    @application.update!(
      application_date: Date.current.to_s,
      application_progress: ApplicationProgress.new,
    )
    @application.assign_urn!
  end

  def send_email_to_applicant
    template_id = ENV.fetch("GOVUK_NOTIFY_APPLICATION_SUBMITTED_TEMPLATE_ID")
    email_address = @application.applicant.email_address
    application_id = @application.urn

    GovukNotify::Client.send_email(
      template_id,
      email_address,
      application_id,
    )
  end
end
