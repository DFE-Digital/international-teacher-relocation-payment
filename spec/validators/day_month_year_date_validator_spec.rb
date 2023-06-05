# spec/validators/day_month_year_date_validator_spec.rb

require "rails_helper"

RSpec.describe DayMonthYearDateValidator do
  class Validatable
    include ActiveModel::Model
    attr_accessor :day, :month, :year

    validate do |record|
      DayMonthYearDateValidator.new.validate(record)
    end
  end

  subject(:validatable) { Validatable.new(valid_attributes) }

  let(:valid_attributes) { { day: "15", month: "6", year: "2023" } }

  describe "#validate" do
    context "when the date is valid" do
      it "passes validation" do
        validatable.valid?

        expect(validatable).to be_valid
      end
    end

    context "when the date is invalid" do
      it "fails validation with non-existing dates" do
        validatable.day = "31"
        validatable.month = "2" # Invalid month
        validatable.valid?

        expect(validatable.errors[:day_month_year_date]).to include("Enter a valid date")
      end

      it "fails validation with negative numbers" do
        validatable.day = -1
        validatable.month = "2" # Invalid month
        validatable.valid?

        expect(validatable.errors[:day_month_year_date]).to include("Enter a valid date")
      end
    end

    context "when missing fields" do
      it "does not perform validation if day `nil`" do
        validatable.day = nil

        expect(validatable).to be_valid
      end

      it "does not perform validation if month `nil`" do
        validatable.month = nil

        expect(validatable).to be_valid
      end

      it "does not perform validation if year `nil`" do
        validatable.year = nil

        expect(validatable).to be_valid
      end
    end
  end
end
