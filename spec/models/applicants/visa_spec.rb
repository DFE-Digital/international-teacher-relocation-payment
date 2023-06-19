# frozen_string_literal: true

require "rails_helper"

module Applicants
  describe Visa do
    let(:params) { {} }

    subject(:model) { described_class.new(params) }

    describe "validations" do
      it { is_expected.to validate_presence_of(:visa_type) }

      it {
        expect(model).to validate_inclusion_of(:visa_type)
          .in_array(Applicants::Visa::VISA_OPTIONS)
      }
    end

    describe "#eligible?" do
      subject { described_class.new(params).eligible? }

      context "when visa is other" do
        let(:params) { { visa_type: "Other" } }

        it { is_expected.to be_falsey }
      end
    end
  end
end
