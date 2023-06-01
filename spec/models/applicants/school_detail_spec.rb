# frozen_string_literal: true

require "rails_helper"

module Applicants
  describe SchoolDetail do
    let(:params) { {} }

    subject(:model) { described_class.new(params) }

    describe "validations" do
      it { is_expected.to validate_presence_of(:state_funded_secondary_school) }

      it {
        expect(model).to validate_inclusion_of(:state_funded_secondary_school)
          .in_array(Applicants::SchoolDetail::SCHOOL_OPTIONS)
      }
    end

    describe "#eligible?" do
      subject { described_class.new(params).eligible? }

      context "when state_funded_secondary_school is false" do
        let(:params) { { state_funded_secondary_school: "no" } }

        it { is_expected.to be_falsey }
      end

      context "when state_funded_secondary_school is true" do
        let(:params) { { state_funded_secondary_school: "yes" } }

        it { is_expected.to be_truthy }
      end
    end
  end
end
