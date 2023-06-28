class SubmitApplication
  def initialize(applicant)
    @applicant = applicant
  end

  def run
      application = Application.create!(
        applicant: @applicant,
        application_date: Date.current.to_s,
        application_progress: ApplicationProgress.new,
      )

      template_id = ENV.fetch("GOVUK_NOTIFY_APPLICATION_SUBMITTED_TEMPLATE_ID")
      email_address = @applicant.email_address
      application_id = application.urn

      GovukNotify::Client.send_email(
        template_id,
        email_address,
        application_id,
      )

      application
  end
end
