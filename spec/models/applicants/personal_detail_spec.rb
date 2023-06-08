# frozen_string_literal: true

require "rails_helper"

module Applicants
  describe PersonalDetail do
    let(:params) { {} }

    subject(:model) { described_class.new(params) }

    describe "validations" do
      it { is_expected.to validate_presence_of(:given_name) }
      it { is_expected.to validate_presence_of(:family_name) }
      it { is_expected.to validate_presence_of(:email_address) }
      it { is_expected.to validate_presence_of(:phone_number) }
      it { is_expected.to validate_presence_of(:sex) }
      it { is_expected.to validate_presence_of(:passport_number) }
      it { is_expected.to validate_presence_of(:nationality) }
      it { is_expected.to validate_presence_of(:address_line_1) }
      it { is_expected.not_to validate_presence_of(:address_line_2) }
      it { is_expected.to validate_presence_of(:city) }
      it { is_expected.not_to validate_presence_of(:county) }
      it { is_expected.to validate_presence_of(:postcode) }

      it {
        expect(model).to validate_inclusion_of(:sex)
                           .in_array(Applicants::PersonalDetail::SEX_OPTIONS)
      }

      describe "date_of_birth" do
        context "when date_of_birth is invalid" do
          let(:params) { { day: "31", month: "02", year: "2000" } }

          it "is invalid" do
            expect(model).not_to be_valid
          end
        end

        context "when date_of_birth is valid" do
          let(:params) { { day: "01", month: "01", year: "2000" } }

          it "is valid" do
            model.valid?

            expect(model.errors["date_of_birth"]).to be_blank
          end
        end
      end
    end
  end
end
