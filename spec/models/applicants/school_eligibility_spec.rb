# frozen_string_literal: true

require "rails_helper"

module Applicants
  describe SchoolEligibility, type: :model do
    let(:params) { {} }
    subject { described_class.new(params) }

    describe "validations" do
      it { is_expected.to validate_inclusion_of(:state_funded_secondary_school)
        .in_array(Applicants::SchoolEligibility::SCHOOL_OPTIONS) }
    end

    describe "#eligible?" do
      subject { described_class.new(params).eligible? }

      context "when state_funded_secondary_school is false" do
        let(:params) { { state_funded_secondary_school: "false" } }
        it { is_expected.to be_falsey }
      end

      context "when state_funded_secondary_school is true" do
        let(:params) { { state_funded_secondary_school: "true" } }
        it { is_expected.to be_truthy }
      end
    end
  end
end