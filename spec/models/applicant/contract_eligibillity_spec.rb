# frozen_string_literal: true

require "rails_helper"

module Applicant
  describe ContractEligibility, type: :model do
    let(:params) { {} }
    subject { described_class.new(params) }

    describe "validations" do
      it { is_expected.to validate_inclusion_of(:contract_type)
        .in_array(Applicant::ContractEligibility::CONTRACT_TYPE_OPTIONS) }
    end

    describe "#eligible?" do
      subject { described_class.new(params).eligible? }

      context "when contract_type is permanent" do
        let(:params) { { contract_type: "permanent" } }
        it { is_expected.to be_truthy }
      end

      context "when contract_type is fixed_term" do
        let(:params) { { contract_type: "fixed_term" } }
        it { is_expected.to be_truthy }
      end

      context "when contract_type is other" do
        let(:params) { { contract_type: "other" } }
        it { is_expected.to be_falsey }
      end
    end
  end
end