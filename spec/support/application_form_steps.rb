# frozen_string_literal: true

RSpec.shared_context "with common application form steps" do
  def when_i_start_the_form
    visit(root_path)

    click_link("Start")
  end

  def and_i_complete_application_route_question_with(option:)
    raise "Unexpected option: #{option}" unless %w[salaried_trainee teacher].include?(option)

    choose(option:)

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
    select("Family visa")

    click_button("Continue")
  end

  def and_i_enter_my_entry_date
    fill_in("Day", with: 12)
    fill_in("Month", with: 6)
    fill_in("Year", with: 2023)

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
    fill_in("applicants_personal_detail[phone_number]", with: "01234567890")
    fill_in("applicants_personal_detail[address_line_1]", with: "12 Park Gardens")
    fill_in("applicants_personal_detail[address_line_2]", with: "Office 20")
    fill_in("applicants_personal_detail[city]", with: "London")
    fill_in("applicants_personal_detail[county]", with: "A county")
    fill_in("applicants_personal_detail[postcode]", with: "AS1 1AA")
    select("English")
    choose("Male")
    fill_in("applicants_personal_detail[passport_number]", with: "000")

    click_button("Continue")
  end

  def and_i_enter_my_employment_details
    fill_in("applicants_employment_detail[school_headteacher_name]", with: "Mr Headteacher")
    fill_in("applicants_employment_detail[school_name]", with: "School name")
    fill_in("applicants_employment_detail[school_address_line_1]", with: "1, McSchool Street")
    fill_in("applicants_employment_detail[school_address_line_2]", with: "Schoolville")
    fill_in("applicants_employment_detail[school_city]", with: "Schooltown")
    fill_in("applicants_employment_detail[school_county]", with: "Schoolshire")
    fill_in("applicants_employment_detail[school_postcode]", with: "SC1 1AA")

    click_button("Submit application")
  end

  def choose_yes
    choose("Yes")

    click_button("Continue")
  end

  def and_i_enter_my_contract_start_date
    fill_in("Day", with: 12)
    fill_in("Month", with: 7)
    fill_in("Year", with: 2023)

    click_button("Continue")
  end
end
