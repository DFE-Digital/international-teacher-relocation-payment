require "rails_helper"

RSpec.describe NationalityBreakdownQuery, type: :model do
  describe "#call" do
    context "when there are a few applicants" do
      before do
        create(:applicant, nationality: "Nationality 1")
        create_list(:applicant, 2, nationality: "Nationality 2")
        create(:applicant, nationality: "Nationality 3")
        create(:applicant, nationality: "Nationality 4")
        create_list(:applicant, 3, nationality: "Nationality 5")
      end

      it "returns the correct route breakdown numbers" do
        result = described_class.new.call

        expect(result).to eq({
          "Nationality 5" => 3,
          "Nationality 2" => 2,
          "Nationality 1" => 1,
          "Nationality 3" => 1,
          "Nationality 4" => 1,
        })
      end

      it "returns the breakdown in the right order" do
        result = described_class.new.call

        expected_keys = ["Nationality 5", "Nationality 2", "Nationality 4", "Nationality 1", "Nationality 3"]

        expect(result.keys).to eq(expected_keys)
      end
    end

    context "when there are no applicants" do
      it "returns the empty hash breakdown" do
        result = described_class.new.call

        expect(result).to eq({})
      end
    end
  end
end
