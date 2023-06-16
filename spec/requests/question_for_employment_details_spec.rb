require "rails_helper"

module Applicants
  RSpec.describe "Question for Employment details" do
    describe "POST create" do
      let(:valid_params) do
        {
          applicants_employment_detail: {
            "school_name" => "Alexander McLeod Primary School",
            "school_postcode" => "E1 8QS",
            "school_headteacher_name" => "Mr. Headteacher",
          },
        }
      end

      before do
        set_applicant_details!
      end

      context "with valid params" do
        it "redirects to the submitted path" do
          post "/applicants/employment_details", params: valid_params

          expect(response).to redirect_to(submitted_path)
        end

        it "creates an Applicant record" do
          expect { post "/applicants/employment_details", params: valid_params }
            .to change(Applicant, :count).by(1)
        end

        it "creates a School" do
          expect { post "/applicants/employment_details", params: valid_params }
            .to change(School, :count).by(1)
        end

        it "creates an Address" do
          expect { post "/applicants/employment_details", params: valid_params }
            .to change(Address, :count).by(1)
        end

        it "links the applicant with the school and the address" do
          post "/applicants/employment_details", params: valid_params

          expect(Applicant.last.school).to eq(School.last)
          expect(Applicant.last.address).to eq(Address.last)
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
          follow_redirect!

          expect(response.body).to include("Thank you for completing")
        end
      end
    end

    # rubocop:disable RSpec/AnyInstance
    def set_applicant_details!
      # TODO: Remove this stub when we have a better way of storing the route type on the DB
      # The current implementation of the application route is to store it in the session,
      # this is not ideal and should be changed to be stored in the database. For now we are
      # stubbing the session to return the route type, but this is temporary.
      allow_any_instance_of(EmploymentDetailsController).to receive(:session).and_return({
        "application_route" => "teacher",
        "personal_detail" => {
          "given_name" => "John",
          "family_name" => "Doe",
          "email_address" => "john@email.com",
          "phone_number" => "07700 900 982",
          "date_of_birth" => "10-12-2010",
          "sex" => "Male",
          "nationality" => "Spanish",
          "passport_number" => "123456789",
          "subject" => "Maths",
          "visa_type" => "Tier 2",
          "entry_date" => "1-8-2023",
        },
      })
    end

    # rubocop:enable RSpec/AnyInstance
  end
end
