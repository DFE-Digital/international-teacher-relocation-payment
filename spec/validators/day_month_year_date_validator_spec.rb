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

  subject(:validatable) { Validatable.new }

  describe "#validate" do
    context "when the date is valid" do
      it "passes validation" do
        validatable.day = 15
        validatable.month = 6
        validatable.year = 2023
        validatable.valid?

        expect(validatable).to be_valid
      end
    end

    context "when the date is invalid" do
      it "fails validation" do
        validatable.day = 31
        validatable.month = 2 # Invalid month
        validatable.year = 2023
        validatable.valid?

        expect(validatable.errors[:day_month_year_date]).to include("Enter a valid date")
      end
    end

    context "when missing fields" do
      before do
        validatable.day = 15
        validatable.month = 6
        validatable.year = 2023
      end

      it "fails validation when missing day" do
        validatable.day = nil
        validatable.valid?

        expect(validatable.errors[:day_month_year_date]).to include("Enter a valid date")
      end

      it "fails validation when missing month" do
        validatable.month = nil
        validatable.valid?

        expect(validatable.errors[:day_month_year_date]).to include("Enter a valid date")
      end

      it "fails validation when missing year" do
        validatable.year = nil
        validatable.valid?

        expect(validatable.errors[:day_month_year_date]).to include("Enter a valid date")
      end
    end
  end
end