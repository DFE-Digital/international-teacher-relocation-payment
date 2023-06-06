# frozen_string_literal: true

require "rails_helper"

module Applicants
  describe EntryDate do
    describe "#entry_date" do
      context "when all date fields are valid" do
        let(:entry_date) { described_class.new(day: "1", month: "2", year: "2023") }

        it "returns a valid Date object" do
          expect(entry_date.entry_date).to be_a(Date)
        end

        it "is valid" do
          expect(entry_date).to be_valid
        end
      end

      context "when the date is invalid" do
        let(:entry_date) { described_class.new(day: "31", month: "2", year: "2023") }

        it "returns an InvalidDate object" do
          expect(entry_date.entry_date).to be_a(Applicants::EntryDate::InvalidDate)
        end

        it "is not valid" do
          expect(entry_date).not_to be_valid
        end
      end

      describe "validations" do
        it "validates presence of the day of the month" do
          params = { day: "", month: "2", year: "2023" }

          value = described_class.new(params)
          expect(value).not_to be_valid
        end

        it "validates presence of the month" do
          params = { day: "2", month: "", year: "2023" }

          value = described_class.new(params)
          expect(value).not_to be_valid
        end
      end
    end
  end
end
