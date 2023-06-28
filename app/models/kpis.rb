class Kpis
  def initialize
    @applications = Applicant.all
  end

  def total_applications
    @applications.count
  end

  def route_breakdown
    RouteBreakdownQuery.new.call
  end

  def subject_breakdown
    SubjectBreakdownQuery.new.call
  end

  def nationality_breakdown
    NationalityBreakdownQuery.new.call.first(5)
  end
end
