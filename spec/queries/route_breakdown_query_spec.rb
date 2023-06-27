require "rails_helper"

RSpec.describe RouteBreakdownQuery, type: :model do
  describe "#call" do
    context "when there are a few applicants" do
      before do
        create(:applicant, :teacher)
        create(:applicant, :salaried_trainee)
        create(:applicant, :teacher)
      end

      it "returns the correct route breakdown" do
        result = described_class.new.call

        expect(result).to eq({
          "teacher" => 2,
          "salaried_trainee" => 1,
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
