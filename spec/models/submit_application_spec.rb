require "rails_helper"

describe SubmitApplication do
  describe "#run!" do
    subject(:submit_application) { described_class.new(application) }

    let(:application) { create(:application) }

    it "returns an application" do
      expect(submit_application.run).to be_a(Application)
    end

    it "sets the applicant" do
      submit_application.run

      expect(application).to be_present
    end

    it "sets the application date" do
      application = submit_application.run

      expect(application.application_date).to eq(Date.current)
    end

    it "sets the urn" do
      application = submit_application.run

      expect(application.urn).to be_present
    end

    it "send an email" do
      allow(GovukNotify::Client).to receive(:send_email)

      submit_application.run

      expect(GovukNotify::Client).to have_received(:send_email).with(
        "661cdff0-08f0-4ccc-b23c-7d9d442517f6",
        application.applicant.email_address,
        application.urn,
      )
    end
  end
end
