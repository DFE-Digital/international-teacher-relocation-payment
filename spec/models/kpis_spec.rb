require "rails_helper"

RSpec.describe Kpis do
  describe "#total_applications" do
    it "returns the total number of applications" do
      create_list(:applicant, 5)

      kpis = described_class.new

      expect(kpis.total_applications).to eq(5)
    end
  end
end
