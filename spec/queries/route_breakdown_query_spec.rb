require "rails_helper"

RSpec.describe RouteBreakdownQuery, type: :model do
  describe "#call" do
    let(:applicant1) { create(:applicant, application_route: "Route 1") }
    let(:applicant2) { create(:applicant, application_route: "Route 2") }
    let(:applicant3) { create(:applicant, application_route: "Route 1") }

    it "returns the correct route breakdown" do
      result = described_class.new.call

      expect(result).to eq({
        "Route 1" => 2, # applicant1 and applicant3
        "Route 2" => 1, # applicant2
      })
    end
  end
end
