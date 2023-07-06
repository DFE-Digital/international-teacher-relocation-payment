# frozen_string_literal: true

require "rails_helper"

describe "teacher route: completing the form" do
  include_context "with common application form steps"

  describe "navigating forward" do
    context "eligible users" do
      it "submits an application" do
        when_i_start_the_form
        and_i_complete_application_route_question_with(option: "teacher")
        and_i_complete_the_state_school_question
        and_i_complete_the_contract_details_question
        and_i_enter_my_contract_start_date
        and_i_select_my_subject("teacher")
        and_i_select_my_visa_type
        and_i_enter_my_entry_date("teacher")
        and_i_enter_my_personal_details
        and_i_enter_my_employment_details

        then_the_application_is_submitted_successfully
      end
    end

    context "non-eligible users" do
      it "does not allow the user to continue the journey" do
        when_i_start_the_form
        and_i_complete_application_route_question_with(option: "teacher")
        and_i_complete_the_state_school_question
        and_i_complete_the_contract_details_question
        and_i_enter_an_invalid_date

        expect(page).to have_text("Enter a valid date")
      end
    end
  end
end
