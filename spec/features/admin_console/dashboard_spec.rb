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

  it "shows the Total Rejections widget" do
    given_there_are_rejected_applications
    given_i_am_signed_as_an_admin
    when_i_am_in_the_dashboard_page
    then_i_can_see_the_total_rejections_widget
  end

  it "shows the Average Age widget" do
    given_there_are_3_applicants_with_ages
    given_i_am_signed_as_an_admin
    when_i_am_in_the_dashboard_page
    then_i_can_see_the_average_age_widget
  end

  it "shows the Total Paid widget" do
    given_there_are_paid_applications
    given_i_am_signed_as_an_admin
    when_i_am_in_the_dashboard_page
    then_i_can_see_the_total_paid_widget
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

  it "shows the Visa Breakdown widget" do
    given_there_are_few_applications_with_visas
    given_i_am_signed_as_an_admin
    when_i_am_in_the_dashboard_page
    then_i_can_see_the_visa_type_breakdown_widget
  end

  it "shows the Nationalities Breakdown widget" do
    given_there_are_few_applications_with_nationalities
    given_i_am_signed_as_an_admin
    when_i_am_in_the_dashboard_page
    then_i_can_see_the_nationalities_breakdown_widget
  end

  it "shows the Gender Breakdown widget" do
    given_there_are_few_applications
    given_i_am_signed_as_an_admin
    when_i_am_in_the_dashboard_page
    then_i_can_see_the_gender_breakdown_widget
  end

  it "shows the Initial Checks Approval average time widget" do
    given_there_are_applications_with_initial_checks
    given_i_am_signed_as_an_admin
    when_i_am_in_the_dashboard_page
    then_i_can_see_the_initial_checks_approval_average_time_widget
  end

  def given_there_are_5_applications
    create_list(:application, 5)
  end

  def given_there_are_few_applications
    create(:applicant, :teacher, subject: :physics, sex: :male)
    create(:applicant, :teacher, subject: :languages, sex: :female)
    create(:applicant, :salaried_trainee, subject: :general_science, sex: :male)
  end

  def given_there_are_paid_applications
    application = create(:application)
    create_list(:application_progress, 2, :with_payment_completed, application:)
  end

  def given_there_are_few_applications_with_nationalities
    create(:applicant, nationality: "Chadians")
    create(:applicant, nationality: "Libians")
    create(:applicant, nationality: "Uzbeks")
    create(:applicant, nationality: "Mongolians")
    create(:applicant, nationality: "Spaniards")
  end

  def given_there_are_few_applications_with_visas
    create(:applicant, visa_type: Applicants::Visa::VISA_OPTIONS[0])
    create(:applicant, visa_type: Applicants::Visa::VISA_OPTIONS[1])
    create(:applicant, visa_type: Applicants::Visa::VISA_OPTIONS[2])
  end

  def given_there_are_rejected_applications
    application = create(:application)
    create_list(:application_progress, 2, :with_rejection_completed, application:)
  end

  def given_there_are_3_applicants_with_ages
    create(:applicant, date_of_birth: 35.years.ago)
    create(:applicant, date_of_birth: 45.years.ago)
    create(:applicant, date_of_birth: 52.years.ago)
  end

  def given_there_are_applications_with_initial_checks
    create(:application_progress, :with_initial_checks_completed, application: build(:application),
                                                                  created_at: 10.days.ago, initial_checks_completed_at: 5.days.ago)
    create(:application_progress, :with_initial_checks_completed, application: build(:application),
                                                                  created_at: 20.days.ago, initial_checks_completed_at: 10.days.ago)
    create(:application_progress, :with_initial_checks_completed, application: build(:application),
                                                                  created_at: 30.days.ago, initial_checks_completed_at: 15.days.ago)
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

  def then_i_can_see_the_total_rejections_widget
    within ".kpi-widget.rejections" do
      expect(page).to have_content("Total Rejections")
      expect(page).to have_content("2")
    end
  end

  def then_i_can_see_the_average_age_widget
    within ".kpi-widget.age" do
      expect(page).to have_content("Average Age")
      expect(page).to have_content("44 years")
    end
  end

  def then_i_can_see_the_total_paid_widget
    within ".kpi-widget.paid" do
      expect(page).to have_content("Total Paid")
      expect(page).to have_content("2")
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

  def then_i_can_see_the_visa_type_breakdown_widget
    within ".kpi-widget.visas" do
      expect(page).to have_content("Visa")
      expect(page).to have_content(Applicants::Visa::VISA_OPTIONS[0])
      expect(page).to have_content(Applicants::Visa::VISA_OPTIONS[1])
      expect(page).to have_content(Applicants::Visa::VISA_OPTIONS[2])
      expect(page).to have_content("1")
    end
  end

  def then_i_can_see_the_nationalities_breakdown_widget
    within ".kpi-widget.nationalities" do
      expect(page).to have_content("Nationalities")
      expect(page).to have_content("Chadians")
      expect(page).to have_content("Libians")
      expect(page).to have_content("Uzbeks")
      expect(page).to have_content("Mongolians")
      expect(page).to have_content("Spaniards")
      expect(page).to have_content("1")
    end
  end

  def then_i_can_see_the_gender_breakdown_widget
    within ".kpi-widget.genders" do
      expect(page).to have_content("Genders")
      expect(page).to have_content("Male")
      expect(page).to have_content("Female")
    end
  end

  def then_i_can_see_the_initial_checks_approval_average_time_widget
    within ".kpi-widget.initial-checks-average" do
      expect(page).to have_content("Time to Initial Checks")
      expect(page).to have_content("10 days")
    end
  end
end
