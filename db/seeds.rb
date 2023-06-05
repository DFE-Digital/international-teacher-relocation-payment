# frozen_string_literal: true

Applicant.destroy_all
ApplicantProgress.destroy_all

100.times do |i|
  # First 50 applicants are salaried trainees, next 50 are teachers
  route = i < 50 ? "salaried trainee" : "teacher"

  applicant = FactoryBot.create(:applicant, application_route: route, created_at: rand(30..90).days.ago.to_date)

  progress_attrs =
    case i
    when 0..9 # First 10 salaried trainees and first 10 teachers
    when 50..59
      {
        initial_checks_completed_at: rand(21..30).days.ago.to_date,
        home_office_checks_completed_at: nil,
        school_checks_completed_at: nil,
        school_investigation_required: false,
        visa_investigation_required: false,
        applicant_id: applicant.id,
      }
    when 10..19
    when 60..69 # Second 10 salaried trainees and second 10 teachers
      {
        initial_checks_completed_at: rand(21..30).days.ago.to_date,
        visa_investigation_required: true,
        home_office_checks_completed_at: nil,
        school_checks_completed_at: nil,
        school_investigation_required: false,
        applicant_id: applicant.id,
      }
    when 20..29
    when 70..79 # Third 10 salaried trainees and third 10 teachers
      {
        initial_checks_completed_at: rand(21..30).days.ago.to_date,
        visa_investigation_required: true,
        home_office_checks_completed_at: rand(11..20).days.ago.to_date,
        school_investigation_required: false,
        school_checks_completed_at: nil,
        applicant_id: applicant.id,
      }

    when 30..39
    when 80..89 # Fourth 10 salaried trainees and fourth 10 teachers
      {
        initial_checks_completed_at: rand(21..30).days.ago.to_date,
        visa_investigation_required: true,
        home_office_checks_completed_at: rand(11..20).days.ago.to_date,
        school_investigation_required: true,
        school_checks_completed_at: nil,
        applicant_id: applicant.id,
      }
    when 40..49
    when 90..99 # Fifth 10 salaried trainees and fifth 10 teachers
      {
        initial_checks_completed_at: rand(21..30).days.ago.to_date,
        visa_investigation_required: true,
        home_office_checks_completed_at: rand(11..20).days.ago.to_date,
        school_investigation_required: true,
        school_checks_completed_at: rand(10..10).days.ago.to_date,
        applicant_id: applicant.id,
      }
    end

  FactoryBot.create(:applicant_progress, progress_attrs)
end
