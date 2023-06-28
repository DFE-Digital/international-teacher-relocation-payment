# frozen_string_literal: true

require "rails_helper"

describe "Dashboard" do
  include AdminHelpers

  it "shows the Total Applications widget" do
    given_there_are_5_applications
    given_i_am_signed_as_an_admin
    when_i_am_in_the_dashboard_page
    then_i_can_see_the_applications_widget
  end

  it "shows the Average Age widget" do
    given_there_are_3_applicants_with_ages
    given_i_am_signed_as_an_admin
    when_i_am_in_the_dashboard_page
    then_i_can_see_the_average_age_widget
  end

  it "shows the Route Breakdown widget" do
    given_there_are_few_applications
    given_i_am_signed_as_an_admin
    when_i_am_in_the_dashboard_page
    then_i_can_see_the_route_breakdown_widget
  end

  it "shows the Subject Breakdown widget" do
    given_there_are_few_applications
    given_i_am_signed_as_an_admin
    when_i_am_in_the_dashboard_page
    then_i_can_see_the_subject_breakdown_widget
  end

  def given_there_are_5_applications
    create_list(:applicant, 5)
  end

  def given_there_are_few_applications
    create(:applicant, :teacher, subject: :physics)
    create(:applicant, :teacher, subject: :languages)
    create(:applicant, :salaried_trainee, subject: :general_science)
  end

  def given_there_are_3_applicants_with_ages
    create(:applicant, date_of_birth: 35.years.ago)
    create(:applicant, date_of_birth: 45.years.ago)
    create(:applicant, date_of_birth: 52.years.ago)
  end

  def when_i_am_in_the_dashboard_page
    visit(dashboard_path)
  end

  def then_i_can_see_the_applications_widget
    within ".kpi-widget.applications" do
      expect(page).to have_content("Applications")
      expect(page).to have_content("5")
    end
  end

  def then_i_can_see_the_average_age_widget
    within ".kpi-widget.age" do
      expect(page).to have_content("Average Age")
      expect(page).to have_content("44 years")
    end
  end

  def then_i_can_see_the_route_breakdown_widget
    within ".kpi-widget.routes" do
      expect(page).to have_content("Routes")
      expect(page).to have_content("Teacher")
      expect(page).to have_content("2")
      expect(page).to have_content("Salaried Trainee")
      expect(page).to have_content("1")
    end
  end

  def then_i_can_see_the_subject_breakdown_widget
    within ".kpi-widget.subjects" do
      expect(page).to have_content("Subjects")
      expect(page).to have_content("General Science")
      expect(page).to have_content("Languages")
      expect(page).to have_content("Physics")
      expect(page).to have_content("1")
    end
  end
end
