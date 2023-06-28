require "rails_helper"

RSpec.describe NationalityBreakdownQuery, type: :model do
  describe "#call" do
    context "when there are a few applicants" do
      before do
        create(:applicant, nationality: "Nationality 1")
        create(:applicant, nationality: "Nationality 2")
        create(:applicant, nationality: "Nationality 3")
        create(:applicant, nationality: "Nationality 4")
        create(:applicant, nationality: "Nationality 5")
      end

      it "returns the correct route breakdown" do
        result = described_class.new.call

        expect(result).to eq({
          "Nationality 1" => 1,
          "Nationality 2" => 1,
          "Nationality 3" => 1,
          "Nationality 4" => 1,
          "Nationality 5" => 1,
        })
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
