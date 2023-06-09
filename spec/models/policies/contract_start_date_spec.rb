# frozen_string_literal: true

require "rails_helper"

RSpec.describe Policies::ContractStartDate do
  let(:first_monday_july) { Date.new(2023, 7, 3) }

  describe "#eligible?" do
    it "returns true when the date is on the first Monday in July" do
      expect(described_class.eligible?(first_monday_july)).to be true
    end

    it "returns true when the date is after the first Monday in July" do
      date = first_monday_july.advance(days: 1)

      expect(described_class.eligible?(date)).to be true
    end

    it "returns false when the date is before the first Monday in July" do
      date = first_monday_july.advance(days: -1)
      expect(described_class.eligible?(date)).to be false
    end
  end
end
