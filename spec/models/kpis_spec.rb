require "rails_helper"

RSpec.describe Kpis do
  describe "#total_applications" do
    it "returns the total number of applications" do
      create_list(:applicant, 5)

      stats = described_class.new

      expect(stats.total_applications).to eq(5)
    end
  end

  describe "#route_breakdown" do
    it "delegates to RouteBreakdownQuery" do
      route_breakdown_query = instance_double(RouteBreakdownQuery)
      allow(RouteBreakdownQuery).to receive(:new).and_return(route_breakdown_query)
      allow(route_breakdown_query).to receive(:call).and_return("Result")

      kpi_stats = described_class.new

      result = kpi_stats.route_breakdown

      expect(RouteBreakdownQuery).to have_received(:new)
      expect(route_breakdown_query).to have_received(:call)
      expect(result).to eq("Result")
    end
  end
end
