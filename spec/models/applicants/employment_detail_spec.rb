# frozen_string_literal: true

require "rails_helper"

module Applicants
  describe EmploymentDetail, type: :model do
    let(:params) { {} }
    subject { described_class.new(params) }

    describe "validations" do
      it { is_expected.to validate_presence_of(:school_name) }
      it { is_expected.to validate_presence_of(:school_headteacher_name) }
    end
  end
end