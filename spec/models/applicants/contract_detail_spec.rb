# frozen_string_literal: true

require "rails_helper"

module Applicants
  describe ContractDetail, type: :model do
    let(:params) { {} }
    subject { described_class.new(params) }

    describe "validations" do
      it { is_expected.to validate_presence_of(:one_year) }

      it { is_expected.to validate_inclusion_of(:one_year)
        .in_array(Applicants::ContractDetail::ONE_YEAR_OPTIONS) }
    end

    describe "#eligible?" do
      subject { described_class.new(params).eligible? }

      context "when one_year is Yes" do
        let(:params) { { one_year: "yes" } }
        it { is_expected.to be_truthy }
      end

      context "when one_year is No" do
        let(:params) { { one_year: "no" } }
        it { is_expected.to be_falsey }
      end
    end
  end
end