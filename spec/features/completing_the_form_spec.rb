# frozen_string_literal: true

require "rails_helper"

feature "completing the form" do
  context "with no eligibility failures" do
    scenario "submits an application" do
      when_i_start_the_form
      and_i_complete_application_route_question
      and_i_complete_the_state_school_question
      and_i_complete_the_contract_details_question
      and_i_enter_my_contract_start_date
      and_i_select_my_subject
      and_i_confirm_my_subject_percentage
      and_i_select_my_visa_type
      and_i_enter_my_entry_date
      and_i_enter_my_personal_details
      and_i_enter_my_employment_details
      expect(page).to have_text("hank you for completing the international relocation payment application form")
    end
    
    def when_i_start_the_form
      visit(root_path)
      click_link("Start")
    end

    def and_i_complete_application_route_question
      choose(option: "teacher")
      click_button("Continue")
    end

    def and_i_complete_the_state_school_question
      choose_yes
    end

    def and_i_complete_the_contract_details_question
      choose_yes
    end

    def and_i_enter_my_contract_start_date
      fill_in("Day", with: 12)
      fill_in("Month", with: 12)
      fill_in("Year", with: 2020)
      click_button("Continue")
    end

    def and_i_select_my_subject
      choose("Physics")
      click_button("Continue")
    end

    def and_i_confirm_my_subject_percentage
      choose_yes
    end

    def and_i_select_my_visa_type
      select("visa_1")
      click_button("Continue")
    end

    def and_i_enter_my_entry_date
      fill_in("Day", with: 12)
      fill_in("Month", with: 9)
      fill_in("Year", with: 2020)
      click_button("Continue")
    end

    def and_i_enter_my_personal_details
      fill_in("applicants_personal_detail[given_name]", with: "Bob")
      fill_in("applicants_personal_detail[family_name]", with: "Robertson")
      fill_in("applicants_personal_detail[email_address]", with: "test@example.com")
      fill_in("applicants_personal_detail[phone_number]", with: "01234567890")
      fill_in("Day", with: 1)
      fill_in("Month", with: 1)
      fill_in("Year", with: 1990)
      select("English")
      choose("Male")
      fill_in("applicants_personal_detail[passport_number]", with: "000")
      click_button("Continue")
    end

    def and_i_enter_my_employment_details
      fill_in("applicants_employment_detail[school_name]", with: "School name")
      fill_in("applicants_employment_detail[school_headteacher_name]", with: "Ms Headteacher")
      click_button("Submit application")
    end

    def choose_yes
      choose("Yes")
      click_button("Continue")
    end
  end
end
