# frozen_string_literal: true

require "rails_helper"

module Applicants
  describe EmploymentDetail do
    let(:params) { {} }

    include_examples "a valid UK postcode", described_class, :school_postcode

    subject { described_class.new(params) }

    describe "validations" do
      it { is_expected.to validate_presence_of(:school_name) }
      it { is_expected.to validate_presence_of(:school_headteacher_name) }
    end
  end
end
