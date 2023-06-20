# frozen_string_literal: true

require "rails_helper"

module Applicants
  describe Subject do
    let(:params) { {} }

    subject(:model) { described_class.new(params) }

    describe "validations" do
      it { is_expected.to validate_presence_of(:subject) }

      it {
        expect(model).to validate_inclusion_of(:subject)
          .in_array(Applicants::Subject::TEACHER_SUBJECTS)
      }
    end

    describe ".all" do
      subject(:subjects) { described_class.all(application_route) }

      context "when application_route is teacher" do
        let(:application_route) { "teacher" }

        it { is_expected.to eq(Applicants::Subject::TEACHER_SUBJECTS) }
      end

      context "when application_route is salaried_trainee" do
        let(:application_route) { "salaried_trainee" }

        it { is_expected.to eq(Applicants::Subject::TRAINEE_SUBJECTS) }
      end

      context "when application_route is other" do
        let(:application_route) { "other" }

        it { expect { subjects }.to raise_error("Invalid route") }
      end
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
