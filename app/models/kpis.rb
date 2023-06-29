class Kpis
  def initialize
    @applications = Applicant.all
  end

  def total_applications
    @applications.count
  end

  def average_age
    AverageAgeQuery.new.call
  end

  def total_paid
    ApplicationProgress.where.not(payment_completed_at: nil).count
  end

  def route_breakdown
    RouteBreakdownQuery.new.call
  end

  def subject_breakdown
    SubjectBreakdownQuery.new.call
  end

  def visa_breakdown
    VisaBreakdownQuery.new.call
  end

  def nationality_breakdown
    NationalityBreakdownQuery.new.call.first(5)
  end

  def gender_breakdown
    GenderBreakdownQuery.new.call
  end
end
