# frozen_string_literal: true

require "rails_helper"

module Applicants
  describe PersonalDetail, type: :model do
    let(:params) { {} }
    subject { described_class.new(params) }

    describe "validations" do
      it { is_expected.to validate_presence_of(:given_name) }
      it { is_expected.to validate_presence_of(:family_name) }
      it { is_expected.to validate_presence_of(:email_address) }
      it { is_expected.to validate_presence_of(:phone_number) }
      it { is_expected.to validate_presence_of(:sex) }
      it { is_expected.to validate_presence_of(:passport_number) }

      it { is_expected.to validate_inclusion_of(:sex)
        .in_array(Applicants::PersonalDetail::SEX_OPTIONS) }
    end
  end
end