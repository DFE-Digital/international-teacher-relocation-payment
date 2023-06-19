# frozen_string_literal: true

require "rails_helper"

module Applicants
  describe EmploymentDetail do
    let(:params) { {} }

    include_examples "a valid UK postcode", described_class, :school_postcode

    subject(:model) { described_class.new(params) }

    describe "validations" do
      it { is_expected.to validate_presence_of(:school_name) }
      it { is_expected.to validate_presence_of(:school_headteacher_name) }
    end

    describe "save!" do
      let(:params) do
        {
          school_name: "Test School",
          school_headteacher_name: "Test Headteacher",
          school_address_line_1: "Test Address Line 1",
          school_address_line_2: "Test Address Line 2",
          school_city: "Test City",
          school_county: "Test County",
          school_postcode: "SE2 0BA",
        }
      end

      before do
        model.applicant = create :applicant
      end

      it "creates a school" do
        expect { model.save! }.to change(School, :count).by(1)
      end

      it "creates an address" do
        expect { model.save! }.to change(Address, :count).by(1)
      end

      it "links the school with the address" do
        model.save!

        expect(model.applicant.school.address).to eq(Address.last)
      end
    end
  end
end
