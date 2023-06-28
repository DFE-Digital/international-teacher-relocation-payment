require "rails_helper"

RSpec.describe GovukNotify::Client do
  subject(:client) { described_class.new }

  let(:notify_client) { instance_double(Notifications::Client) }

  describe ".send_email" do
    it "sends an email using GovUK Notify" do
      allow(Notifications::Client).to receive(:new).and_return(notify_client)
      allow(notify_client).to receive(:send_email)

      client.send_email("template_id", "email_address", "application_number")

      expect(notify_client).to have_received(:send_email).with(
        template_id: "template_id",
        email_address: "email_address",
        personalisation: {
          application_number: "application_number"
        }
      )
    end
  end
end
