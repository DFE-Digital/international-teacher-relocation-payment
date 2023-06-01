# frozen_string_literal: true

require "rails_helper"

describe "trainee route: completing the form" do
  include_context "with common application form steps"

  context "with no eligibility failures" do
    it "submits an application" do
      when_i_start_the_form
      and_i_complete_application_route_question_with(option: "salaried_trainee")
      and_i_complete_the_trainee_employment_conditions
      and_i_select_my_subject
      and_i_confirm_my_subject_percentage
      and_i_select_my_visa_type
      and_i_enter_my_entry_date
      and_i_enter_my_personal_details
      and_i_enter_my_employment_details

      expect(page).to have_text("Thank you for completing the international relocation payment application form")
    end

    def and_i_complete_the_trainee_employment_conditions
      choose_yes
    end

    def and_i_complete_the_trainee_contract_details_question
      choose_yes
    end
  end
end
