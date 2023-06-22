require "rails_helper"

module Applicants
  RSpec.describe "Question for Personal details" do
    describe "POST create" do
      let(:valid_params) do
        {
          applicants_personal_detail: {
            "application_route" => "teacher",
            "given_name" => "John",
            "family_name" => "Doe",
            "email_address" => "john@email.com",
            "phone_number" => "07702496000",
            "sex" => "male",
            "passport_number" => "123456789",
            "nationality" => "British",
            "address_line_1" => "7 McLeud",
            "address_line_2" => "second line",
            "city" => "London",
            "county" => "County",
            "postcode" => "E1 8QS",
            "date_of_birth(3i)" => "1",
            "date_of_birth(2i)" => "1",
            "date_of_birth(1i)" => "1990",
          },
        }
      end

      context "with valid params" do
        it "redirects to the employment details path" do
          post "/applicants/personal_details", params: valid_params

          expect(response).to redirect_to(new_applicants_employment_detail_path)
        end

        it "creates an Applicant" do
          expect {
            post "/applicants/personal_details", params: valid_params
          }.to change(Applicant, :count).by(1)
        end
      end

      context "with invalid params" do
        let(:invalid) do
          {
            applicants_personal_detail: {
              "school_name" => "Alexander McLeod Primary School",
              "school_postcode" => "E1 8QS",
              "school_headteacher_name" => "Mr. Headteacher",
            },
          }
        end

        it "renders the new template" do
          post "/applicants/personal_details", params: invalid

          expect(response.body).to include("Personal information")
        end
      end
    end
  end
end
