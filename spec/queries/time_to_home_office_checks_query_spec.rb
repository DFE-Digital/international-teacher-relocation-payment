require "rails_helper"

RSpec.describe TimeToHomeOfficeChecksQuery, type: :model do
  describe "#call" do
    before do
      create(:application_progress, :home_office_checks_completed, application: build(:application),
                                                                   initial_checks_completed_at: 10.days.ago, home_office_checks_completed_at: 5.days.ago)
      create(:application_progress, :home_office_checks_completed, application: build(:application),
                                                                   initial_checks_completed_at: 20.days.ago, home_office_checks_completed_at: 10.days.ago)
      create(:application_progress, :home_office_checks_completed, application: build(:application),
                                                                   initial_checks_completed_at: 30.days.ago, home_office_checks_completed_at: 15.days.ago)
    end

    it "returns min, max and average time in days" do
      result = described_class.new.call

      expect(result[:min]).to eq "5 days"
      expect(result[:max]).to eq "15 days"
      expect(result[:average]).to eq "10 days"
    end
  end
end
