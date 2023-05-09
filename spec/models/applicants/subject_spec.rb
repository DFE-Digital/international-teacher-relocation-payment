# frozen_string_literal: true

require "rails_helper"

module Applicants
  describe Subject, type: :model do
    let(:params) { {} }
    subject { described_class.new(params) }

    describe "validations" do
      it { is_expected.to validate_presence_of(:subject) }

      it { is_expected.to validate_inclusion_of(:subject)
        .in_array(Applicants::Subject::SUBJECT_OPTIONS) }
    end

    describe "#eligible?" do
      subject { described_class.new(params).eligible? }

      %w[physics languages general_science].each do |eligible_subject|
        context "when subject is #{eligible_subject}" do
          let(:params) { { subject: eligible_subject } }
          it { is_expected.to be_truthy }
        end
      end

      context "when subject is other" do
        let(:params) { { subject: "other" } }
        it { is_expected.to be_falsey }
      end
    end
  end
end