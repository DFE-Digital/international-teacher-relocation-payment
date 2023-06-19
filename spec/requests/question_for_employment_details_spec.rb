require "rails_helper"

module Applicants
  RSpec.describe "Question for Employment details" do
    describe "POST create" do
      let(:valid_params) do
        {
          applicants_employment_detail: {
            "school_name" => "Alexander McLeod Primary School",
            "school_headteacher_name" => "Mr. Headteacher",
            "school_address_line_1" => "7 McLeud",
            "school_address_line_2" => "second line",
            "school_city" => "London",
            "school_postcode" => "E1 8QS",
            "school_county" => "County",
          },
        }
      end

      before do
        set_applicant_details!
      end

      context "with valid params" do
        it "redirects to the submitted path" do
          post "/applicants/employment_details", params: valid_params

          expect(response).to redirect_to(applicants_submission_path)
        end

        it "creates a School" do
          expect { post "/applicants/employment_details", params: valid_params }
            .to change(School, :count).by(1)
        end

        it "creates an Applicant Address" do
          expect { post "/applicants/employment_details", params: valid_params }
            .to change(Address, :count).by(1)
        end

        it "links the applicant with the school" do
          post "/applicants/employment_details", params: valid_params

          expect(Applicant.last.school).to eq(School.last)
        end
      end

      context "with invalid params" do
        let(:invalid) do
          {
            applicants_employment_detail: {
              "school_name" => "Alexander McLeod Primary School",
              "school_postcode" => "E1 8QS",
              "school_headteacher_name" => "Mr. Headteacher",
            },
          }
        end

        it "renders the new template" do
          post "/applicants/employment_details", params: invalid

          expect(response.body).to include("Employment information")
        end
      end
    end

    # rubocop:disable RSpec/AnyInstance
    def set_applicant_details!
      # TODO: Remove this stub when we can use Factories via FactoryBot
      # The current implementation users the user session to store attributes, which
      # is not ideal and should be changed next. For now we are stubbing the session
      # to return the applicant details.
      applicant = FactoryBot.create(:applicant)
      allow_any_instance_of(EmploymentDetailsController).to receive(:session).and_return({
        applicant_id: applicant.id,
      })
    end
    # rubocop:enable RSpec/AnyInstance
  end
end
