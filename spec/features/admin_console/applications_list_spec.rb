# frozen_string_literal: true

require "rails_helper"

describe "Applications List" do
  include AdminHelpers

  it "shows the correct columns" do
    given_there_are_few_applications
    given_i_am_signed_as_an_admin
    when_i_am_in_the_applications_list_page
    then_i_can_see_the_correct_columns
  end

  it "shows the pagination" do
    given_there_are_few_applications
    given_i_am_signed_as_an_admin
    when_i_am_in_the_applications_list_page
    then_i_can_see_the_pagination
  end

  it "allows searching" do
    given_there_are_few_applications
    given_i_am_signed_as_an_admin
    when_i_am_in_the_applications_list_page
    then_i_can_see_the_search_form
    then_i_can_search_by_given_name
    then_i_can_search_by_family_name
    then_i_can_search_by_email
    then_i_can_search_by_urn
  end

  it "allows filtering by status" do
    given_there_are_applications_with_different_dates
    given_i_am_signed_as_an_admin
    when_i_am_in_the_applications_list_page
    then_i_can_see_the_status_filter_form
    then_i_can_filter_by_status
  end

  it "displays timestamps correctly" do
    given_there_is_an_application_with_all_dates
    given_i_am_signed_as_an_admin
    when_i_am_in_the_applications_list_page
    then_i_can_see_correct_timestamps
  end

  def given_there_are_few_applications
    # Create 2 specific applications for search tests
    unique_applicant = create(:applicant, given_name: "Unique Given Name", family_name: "Unique Family Name", email_address: "unique@example.com")
    create(:application, applicant: unique_applicant, urn: "Unique Urn 1")

    another_applicant = create(:applicant, given_name: "Another Given Name", family_name: "Another Family Name", email_address: "another@example.com")
    create(:application, applicant: another_applicant, urn: "Unique Urn 2")

    # Create 19 more applications for pagination test
    create_list(:application, 19)
  end

  def given_there_are_applications_with_different_dates
    create(:application, application_progress: build(:application_progress, :initial_checks_completed, status: :initial_checks))
    create(:application, application_progress: build(:application_progress, :home_office_checks_completed, status: :home_office_checks))
  end

  def given_there_is_an_application_with_all_dates
    create(:application, application_progress: build(:application_progress,
                                                     :payment_confirmation_completed,
                                                     initial_checks_completed_at: 5.days.ago,
                                                     home_office_checks_completed_at: 4.days.ago,
                                                     school_checks_completed_at: 3.days.ago,
                                                     banking_approval_completed_at: 2.days.ago,
                                                     payment_confirmation_completed_at: 1.day.ago,
                                                     rejection_completed_at: 6.days.ago))
  end

  def when_i_am_in_the_applications_list_page
    visit(applicants_path)
  end

  def then_i_can_see_the_correct_columns
    within ".govuk-table thead" do
      expect(page).to have_content("URN")
      expect(page).to have_content("Name")
      expect(page).to have_content("Submitted")
      expect(page).to have_content("Initial Checks")
      expect(page).to have_content("Home Office Checks")
      expect(page).to have_content("School Checks")
      expect(page).to have_content("Bank Details Approved")
      expect(page).to have_content("Rejected")
    end
  end

  def then_i_can_see_the_pagination
    within "nav.govuk-pagination" do
      expect(page).to have_content("1")
    end
  end

  def then_i_can_see_the_search_form
    expect(page).to have_css("form#search")
  end

  def then_i_can_search_by_given_name
    fill_in "search", with: "Unique Given Name"
    click_button "Search"
    expect(page).to have_content("Unique Given Name Unique Family Name")
    expect(page).to have_content("Unique Urn 1")
  end

  def then_i_can_search_by_family_name
    fill_in "search", with: "Another Family Name"
    click_button "Search"
    expect(page).to have_content("Another Given Name Another Family Name")
    expect(page).to have_content("Unique Urn 2")
  end

  def then_i_can_search_by_email
    fill_in "search", with: "unique@example.com"
    click_button "Search"
    expect(page).to have_content("Unique Given Name Unique Family Name")
    expect(page).to have_content("Unique Urn 1")
  end

  def then_i_can_search_by_urn
    fill_in "search", with: "Unique Urn 2"
    click_button "Search"
    expect(page).to have_content("Another Given Name Another Family Name")
    expect(page).to have_content("Unique Urn 2")
  end

  def then_i_can_see_the_status_filter_form
    expect(page).to have_select("status-field")
  end

  def then_i_can_filter_by_status
    select "Home office checks", from: "status"
    click_button "Search"
    expect(page).to have_content("Home office checks")
  end

  def then_i_can_see_correct_timestamps
    within(".applicants-table td:nth-child(4)") { expect(page).to have_content(5.days.ago.to_date.to_fs(:govuk_date)) }
    within(".applicants-table td:nth-child(5)") { expect(page).to have_content(4.days.ago.to_date.to_fs(:govuk_date)) }
  end
end
