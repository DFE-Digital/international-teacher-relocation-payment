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

      include_examples "a valid UK postcode", described_class

      describe "phone_number" do
        [
          "07700900000", # UK number
          "07700 900 000", # UK number with spaces
          "07700 900-000", # UK number with hyphens
          "7700 900-000", # UK number without `0`
          "+447702909898", # UK number with country code
          "+44 0 7702 909 898", # UK number with country code, spaces and `0`
          "+44 (0)7702-909-898", # UK number with country code, spaces, and `(0)`
          "44 (0) 7702 909 898", # UK number with country code, spaces, `(0)` and no `+`
          "+34 985 256 634", # Spanish number (home) with spaces
          "+34 626577222", # Spanish number (mobile) without spaces
          "+34626577222", # Spanish number (mobile) without spaces and with country code
          "34 626-577-222", # Spanish number (mobile) with spaces and hyphens
        ].each do |valid_number|
          it "is valid for #{valid_number}" do
            model.phone_number = valid_number
            model.valid?

            expect(model.errors["phone_number"]).to be_blank
          end
        end

        [
          "700900000", # UK number without `0` missing digit
          "700 900 000", # UK number without `0` with spaces missing digit
          "+347702909898", # Spanish number with country code extra digits
          "+34 0 7702 909 898", # Spanish number with country code and `0` as extra digit
          "+34 985 256", # spanish number (home) with spaces and missing digits
        ].each do |invalid_number|
          it "is invalid for #{invalid_number}" do
            model.phone_number = invalid_number
            model.valid?

            expect(model.errors["phone_number"]).not_to be_blank
          end
        end
      end

      describe "date_of_birth" do
        context "when date_of_birth is invalid" do
          let(:params) { { day: "31", month: "02", year: "2000" } }

          it "is invalid" do
            model.valid?

            expect(model.errors["date_of_birth"]).not_to be_blank
          end
        end

        context "when date_of_birth is the future" do
          let(:params) { { day: Date.tomorrow.day, month: Date.tomorrow.month, year: Date.tomorrow.year } }

          it "is invalid" do
            expect(model).not_to be_valid
          end
        end

        context "when age is over 80 years old" do
          let(:params) { { day: "01", month: "01", year: 81.years.ago.year } }

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
