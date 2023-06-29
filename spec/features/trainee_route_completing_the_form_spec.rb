# frozen_string_literal: true

require "rails_helper"

describe "trainee route: completing the form" do
  include_context "with common application form steps"

  context "with eligibility failures" do
    context "when not employed in a school as a trainee teacher" do
      it "shows custom inelibility page" do
        when_i_start_the_form
        and_i_complete_application_route_question_with(option: "salaried_trainee")
        and_i_complete_the_trainee_employment_conditions(choose: "No")

        expect(page).to have_text("We’re sorry")
        expect(page).to have_text("If you are enrolled on a fee-paying teacher training course")
      end
    end
  end

  context "with no eligibility failures" do
    it "submits an application" do
      when_i_start_the_form
      and_i_complete_application_route_question_with(option: "salaried_trainee")
      and_i_complete_the_trainee_employment_conditions
      and_i_enter_my_contract_start_date
      and_i_select_my_subject
      and_i_select_my_visa_type
      and_i_enter_my_entry_date
      and_i_enter_my_personal_details
      and_i_enter_my_employment_details

      expect(page).to have_text("You have successfully submitted")
    end
  end

  def and_i_complete_the_trainee_employment_conditions(choose: "Yes")
    choose == "Yes" ? choose_yes : choose_no
  end

  def and_i_complete_the_trainee_contract_details_question
    choose_yes
  end
end
