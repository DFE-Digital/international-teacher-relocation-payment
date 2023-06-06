# frozen_string_literal: true

require "rails_helper"

module Applicants
  describe EntryDate do
    subject(:entry_date) { described_class.new(params) }

    let(:params) { { day:, month:, year: } }
    let(:day) { "1" }
    let(:month) { "2" }
    let(:year) { "2023" }

    context "when all date fields are valid" do
      it "returns a valid object" do
        expect(entry_date).to be_valid
      end

      it "returns a Date object" do
        expect(entry_date.entry_date).to be_a(Date)
      end
    end

    context "when the date is invalid" do
      let(:day) { "31" }

      it "is not valid" do
        expect(entry_date).not_to be_valid
      end

      it "returns an InvalidDate object" do
        expect(entry_date.entry_date).to be_a(Applicants::EntryDate::InvalidDate)
      end
    end

    describe "validations" do
      context "when the day of the month is missing" do
        let(:day) { "" }

        it "is not valid" do
          expect(entry_date).not_to be_valid
        end
      end

      context "when the month is missing" do
        let(:month) { "" }

        it "is not valid" do
          expect(entry_date).not_to be_valid
        end
      end

      context "when the year is missing" do
        let(:year) { "" }

        it "is not valid" do
          expect(entry_date).not_to be_valid
        end
      end
    end
  end
end
