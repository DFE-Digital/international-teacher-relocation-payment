require "rails_helper"

RSpec.describe KpiStats do
  describe "#total_applications" do
    it "returns the total number of applications" do
      create_list(:applicant, 5)

      stats = described_class.new

      expect(stats.total_applications).to eq(5)
    end
  end
end
