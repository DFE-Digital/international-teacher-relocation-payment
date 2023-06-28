require "notifications/client"


module GovukNotify
  class Client
    def self.send_email(template_id, email_address, application_id)
      new.send_email(template_id, email_address, application_id)
    end

    def initialize
      @client = Notifications::Client.new(ENV.fetch("GOVUK_NOTIFY_API_KEY"))
    end

    def send_email(template_id, email_address, application_number)
      @client.send_email(
        template_id: template_id,
        email_address: email_address,
        personalisation: { application_number: application_number },
      )
    end
  end
end
