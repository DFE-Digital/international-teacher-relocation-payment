# frozen_string_literal: true

RSpec.shared_examples "validates phone number with international prefix" do |klass, attribute|
  subject { klass.new }

  describe "Phone number validations for attribute: #{attribute}" do
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
        subject.phone_number = valid_number
        subject.valid?

        expect(subject.errors[attribute]).to be_blank
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
        subject.phone_number = invalid_number
        subject.valid?

        expect(subject.errors[attribute]).not_to be_blank
      end
    end
  end
end
