# frozen_string_literal: true

require "rails_helper"

module Applicants
  describe SalariedCourseDetail, type: :model do
    let(:params) { {} }
    subject { described_class.new(params) }

    describe "validations" do
      it { is_expected.to validate_presence_of(:eligible_course) }

      it { is_expected.to validate_inclusion_of(:eligible_course)
        .in_array(Applicants::SalariedCourseDetail::ELIGIBLE_COURSE_OPTIONS) }
    end

    describe "#eligible?" do
      subject { described_class.new(params).eligible? }

      context "when state_funded_secondary_school is no" do
        let(:params) { { eligible_course: "no" } }
        it { is_expected.to be_falsey }
      end

      context "when state_funded_secondary_school is yes" do
        let(:params) { { eligible_course: "yes" } }
        it { is_expected.to be_truthy }
      end
    end
  end
end