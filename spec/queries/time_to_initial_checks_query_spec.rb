require "rails_helper"

RSpec.describe TimeToInitialChecksQuery, type: :model do
  describe "#call" do
    before do
      create(:application_progress, :with_initial_checks_completed,
             created_at: 10.days.ago, initial_checks_completed_at: 5.days.ago)
      create(:application_progress, :with_initial_checks_completed,
             created_at: 20.days.ago, initial_checks_completed_at: 10.days.ago)
      create(:application_progress, :with_initial_checks_completed,
             created_at: 30.days.ago, initial_checks_completed_at: 15.days.ago)
    end

    it "returns average time in days" do
      result = described_class.new.call
      expect(result).to eq 10.days
    end
  end
end
