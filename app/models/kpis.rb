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

  def route_breakdown
    RouteBreakdownQuery.new.call
  end

  def subject_breakdown
    SubjectBreakdownQuery.new.call
  end
end
