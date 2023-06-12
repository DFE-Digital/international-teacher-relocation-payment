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

    describe "POST create" do
      context "when it is not a teacher" do
        before do
          session["application_route"] = "salaried_trainee"
        end

        it "redirects to the start of the process" do
          post :create, params: valid_params

          expect(response).to redirect_to(new_applicants_application_route_path)
        end
      end

      context "when it is a teacher" do
        before do
          session["application_route"] = "teacher"
        end

        context "with valid params" do
          it "redirects to the new subject path if it is eligible" do
            allow(Policies::ContractStartDate).to receive(:eligible?).and_return(true)
            post :create, params: valid_params

            expect(response).to redirect_to(new_applicants_subject_path)
          end

          it "redirects to the ineligible path if it is not eligible" do
            allow(Policies::ContractStartDate).to receive(:eligible?).and_return(false)
            post :create, params: valid_params

            expect(response).to redirect_to(ineligible_path)
          end
        end

        context "with invalid params" do
          let(:invalid) do
            {
              applicants_contract_start_date: {
                "contract_start_date(3i)" => "31",
                "contract_start_date(2i)" => "31",
                "contract_start_date(1i)" => "2023",
              },
            }
          end

          it "renders the new template" do
            post :create, params: invalid

            expect(response).to render_template(:new)
          end
        end
      end
    end
  end
end
