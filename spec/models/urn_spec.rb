# frozen_string_literal: true

require "rails_helper"

RSpec.describe Urn do
  subject(:urn) { described_class.generate(applicant_type) }

  describe ".generate" do
    context 'when applicant type is "teacher"' do
      let(:applicant_type) { "teacher" }

      it "generates a URN with the correct prefix and suffix" do
        expect(urn).to match(/^IRPTE[A-Z0-9]{6}$/)
      end

      it "generates a Urn with a suffix of only characters in the CHARSET" do
        charset = %w[A B C D E F H J K L M N P R S T U V 0 1 2 3 4 5 6 7 8 9]

        expect(urn[4..].chars).to all(be_in(charset))
      end
    end

    context 'when applicant type is "salaried_trainee"' do
      let(:applicant_type) { "salaried_trainee" }

      it "generates a URN with the correct prefix and suffix" do
        expect(urn).to match(/^IRPLT[A-Z0-9]{6}$/)
      end
    end

    context "when an invalid applicant type is provided" do
      let(:applicant_type) { "invalid_type" }

      it "raises an ArgumentError" do
        expect { urn }.to raise_error(ArgumentError, "Invalid applicant type: invalid_type")
      end
    end
  end
end
