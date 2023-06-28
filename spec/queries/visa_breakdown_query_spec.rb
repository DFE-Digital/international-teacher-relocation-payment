require "rails_helper"

RSpec.describe VisaBreakdownQuery, type: :model do
  describe "#call" do
    context "when there are a few applicants" do
      before do
        create(:applicant, visa_type: "visa_1")
        create(:applicant, visa_type: "visa_2")
        create(:applicant, visa_type: "visa_3")
      end

      it "returns the correct visa breakdown" do
        result = described_class.new.call

        expect(result).to eq({
          "visa_1" => 1,
          "visa_2" => 1,
          "visa_3" => 1,
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
