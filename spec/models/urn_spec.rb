# frozen_string_literal: true

require "rails_helper"

RSpec.describe Urn do
  describe ".generate" do
    context 'when applicant type is "teacher"' do
      it "generates a URN with the correct prefix and suffix" do
        expect(described_class.generate("teacher")).to match(/^IRPTE[A-Z0-9]{6}$/)
      end
    end

    context 'when applicant type is "salaried_trainee"' do
      it "generates a URN with the correct prefix and suffix" do
        expect(described_class.generate("salaried_trainee")).to match(/^IRPLT[A-Z0-9]{6}$/)
      end
    end

    context "when an invalid applicant type is provided" do
      it "raises an ArgumentError" do
        expect { described_class.generate("invalid_type") }.to raise_error(ArgumentError, "Invalid applicant type: invalid_type")
      end
    end
  end

  describe ".applicant_type_code" do
    context 'when applicant type is "teacher"' do
      it "returns the correct code" do
        expect(described_class.applicant_type_code("teacher")).to eq("TE")
      end
    end

    context 'when applicant type is "salaried_trainee"' do
      it "returns the correct code" do
        expect(described_class.applicant_type_code("salaried_trainee")).to eq("LT")
      end
    end

    context "when an invalid applicant type is provided" do
      it "raises an ArgumentError" do
        expect { described_class.applicant_type_code("invalid_type") }.to raise_error(ArgumentError, "Invalid applicant type: invalid_type")
      end
    end
  end
end
