# frozen_string_literal: true

require "rails_helper"

module Applicants
  describe ContractEligibility, type: :model do
    let(:params) { {} }
    subject { described_class.new(params) }

    describe "validations" do
      it { is_expected.to validate_presence_of(:one_year_contract) }

      it { is_expected.to validate_inclusion_of(:one_year_contract)
        .in_array(Applicants::ContractEligibility::ONE_YEAR_CONTRACT_OPTIONS) }
    end

    describe "#eligible?" do
      subject { described_class.new(params).eligible? }

      context "when one_year_contract is permanent" do
        let(:params) { { one_year_contract: "yes" } }
        it { is_expected.to be_truthy }
      end

      context "when one_year_contract is fixed_term" do
        let(:params) { { one_year_contract: "no" } }
        it { is_expected.to be_falsey }
      end
    end
  end
end