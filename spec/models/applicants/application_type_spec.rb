# frozen_string_literal: true

require "rails_helper"

module Applicants
  describe ApplicationType, type: :model do
    let(:params) { {} }
    subject { described_class.new(params) }

    describe "validations" do
      it { is_expected.to validate_inclusion_of(:application_type)
        .in_array(Applicants::ApplicationType::APPLICATION_TYPE_OPTIONS) }
    end

    describe "#eligible?" do
      subject { described_class.new(params).eligible? }

      context "when application_type is teacher" do
        let(:params) { { application_type: "teacher" } }
        it { is_expected.to be_truthy }
      end

      context "when application_type is salaried_trainee" do
        let(:params) { { application_type: "salaried_trainee" } }
        it { is_expected.to be_truthy }
      end

      context "when application_type is other" do
        let(:params) { { application_type: "other" } }
        it { is_expected.to be_falsey }
      end
    end
  end
end