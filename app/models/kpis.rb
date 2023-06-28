class Kpis
  def initialize
    @applications = Applicant.all
  end

  def total_applications
    @applications.count
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
end
