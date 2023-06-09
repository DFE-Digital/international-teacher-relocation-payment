require "rails_helper"

module Applicants
  RSpec.describe ContractStartDatesController do
    let(:valid_params) do
      {
        applicants_contract_start_date: {
          "contract_start_date(3i)" => "1",
          "contract_start_date(2i)" => "1",
          "contract_start_date(1i)" => "2023",
        },
      }
    end

    describe "POST /create" do
      context "with valid parameters" do
        before do
          allow(Policies::ContractStartDate).to receive(:eligible?).and_return(true)

          post applicants_contract_start_dates_path, params: valid_params
        end

        it "redirects to the new subject path" do
          expect(response).to redirect_to(new_applicants_subject_path)
        end
      end

      context "with ineligible contract start date" do
        before do
          allow(Policies::ContractStartDate).to receive(:eligible?).and_return(false)

          post applicants_contract_start_dates_path, params: valid_params
        end

        it "redirects to the ineligible path" do
          expect(response).to redirect_to(ineligible_path)
        end
      end
    end
  end
end
