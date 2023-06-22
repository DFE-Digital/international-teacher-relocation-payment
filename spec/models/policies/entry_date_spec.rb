# frozen_string_literal: true

require "rails_helper"

RSpec.describe Policies::EntryDate do
  subject(:policy) { described_class }

  describe "#eligible?" do
    it "returns true if the entry date is more than 3 months since start of contract" do
      entry_date = Date.parse("2020-01-03")
      start_date = Date.parse("2020-04-02")

      expect(policy.eligible?(entry_date, start_date)).to be(true)
    end

    it "returns true if the entry date is 3 months since start of contract" do
      entry_date = Date.parse("2020-01-02")
      start_date = Date.parse("2020-04-02")

      expect(policy.eligible?(entry_date, start_date)).to be(true)
    end

    it "returns false if the entry date is less than 3 months since start of contract" do
      entry_date = Date.parse("2020-01-01")
      start_date = Date.parse("2020-04-02")

      expect(policy.eligible?(entry_date, start_date)).to be(false)
    end
  end
end
