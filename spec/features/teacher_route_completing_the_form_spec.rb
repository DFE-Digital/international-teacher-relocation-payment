# frozen_string_literal: true

require "rails_helper"

describe "teacher route: completing the form" do
  include_context "with common application form steps"

  context "with no eligibility failures" do
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

  context "with validation errors" do
    it "does not allow the user to continue the journey" do
      when_i_start_the_form
      and_i_complete_application_route_question_with(option: "teacher")
      and_i_complete_the_state_school_question
      and_i_complete_the_contract_details_question
      and_i_enter_an_invalid_date

      expect(page).to have_text("Enter a valid date")
    end

    def and_i_enter_an_invalid_date
      fill_in("Day", with: 31)
      fill_in("Month", with: 2)
      fill_in("Year", with: 2019)

      click_button("Continue")
    end
  end

  def and_i_complete_the_state_school_question
    assert_i_am_in_the_state_school_question

    choose_yes
  end

  def and_i_complete_the_contract_details_question
    assert_i_am_on_the_contract_details_question

    choose_yes
  end

  def assert_i_am_in_the_state_school_question
    expect(page).to have_text(I18n.t("applicants.school_details.title"))
  end

  def assert_i_am_on_the_contract_details_question
    expect(page).to have_text(I18n.t("applicants.contract_details.title"))
  end
end
